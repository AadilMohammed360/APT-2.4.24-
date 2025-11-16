import os
import pandas as pd
import PyPDF2
from PyPDF2 import PdfReader

def ug_pg_miner(qualification):
    df = pd.read_csv('dataset/ug_pg.csv')
    #If qualification is UG
    if qualification in df['UG'].values:
        print("The qualification is an Undergraduate course.")
        from sklearn.feature_extraction.text import TfidfVectorizer
        from sklearn.neighbors import NearestNeighbors
        from joblib import dump, load
        model = load('KNN_Model/model.joblib')
        vectorizer = load('KNN_Model/vectorizer.joblib')
        query = vectorizer.transform([qualification])
        distances, indices = model.kneighbors(query)
        index = indices[0][0]
        # Append all PG corresponding to the UG in the dataset to a list Qualified_PG
        Qualified_PG = df[df['UG'] == df.loc[index, 'UG']]['PG'].tolist()
        pred_keywords = []
        directory = 'media/cv_base'
        pred_keywords.append(qualification)
        pred_keywords.extend(Qualified_PG)
        def search_cv(pred_keywords,directory):
            selected_resumes = []
            for filename in os.listdir(directory):
                if filename.endswith('.pdf'):
                    with open(os.path.join(directory, filename), 'rb') as file:
                        reader = PdfReader(file)

                        for page in reader.pages:
                            page_text = page.extract_text()

                            if any(keyword.lower() in page_text.lower() for keyword in pred_keywords):
                                selected_resumes.append(filename)
                                break
            return selected_resumes
        selected_CV = search_cv(pred_keywords,directory)
        return selected_CV


    #If qualification is PG
    elif qualification in df['PG'].values:
        print("The qualification is a Postgraduate course.")

        pred_keywords = []
        directory = 'media/cv_base'

        pred_keywords.append(qualification)

        def search_cv(pred_keywords,directory):
            selected_resumes = []
            for filename in os.listdir(directory):
                if filename.endswith('.pdf'):
                    with open(os.path.join(directory, filename), 'rb') as file:
                        reader = PdfReader(file)

                        for page in reader.pages:
                            page_text = page.extract_text()

                            if any(keyword.lower() in page_text.lower() for keyword in pred_keywords):
                                selected_resumes.append(filename)
                                break
            return selected_resumes
        selected_CV = search_cv(pred_keywords,directory)
        return selected_CV

    else:
        return False





import os
import pandas as pd
import PyPDF2
from PyPDF2 import PdfReader

# List of keywords to search for
import os
from PyPDF2 import PdfReader
from BaseApp.models import Applicant

def keyword_miner(pred_keywords):
    """
    Search CVs for keywords and return applicant IDs with match scores.
    Returns: dict {applicant_id: score}
    """
    directory = 'media/cv_base'
    results = {}  # {applicant_id: match_count}
    
    def extract_applicant_id_from_filename(filename):
        """
        Extract applicant ID from CV filename.
        Assumes format like: "123_resume.pdf" or "applicant_123.pdf"
        Adjust this based on your actual filename format.
        """
        try:
            # Try to find applicant by CV path
            applicant = Applicant.objects.filter(cvpath__icontains=filename).first()
            if applicant:
                return applicant.id
        except:
            pass
        return None
    
    def search_cv(pred_keywords, directory):
        """Search CVs and count keyword matches per applicant."""
        if not os.path.exists(directory):
            print(f"Directory {directory} does not exist")
            return {}
        
        for filename in os.listdir(directory):
            if filename.endswith('.pdf'):
                applicant_id = extract_applicant_id_from_filename(filename)
                if not applicant_id:
                    continue
                
                match_count = 0
                filepath = os.path.join(directory, filename)
                
                try:
                    with open(filepath, 'rb') as file:
                        reader = PdfReader(file)
                        full_text = ""
                        
                        # Extract all text from PDF
                        for page in reader.pages:
                            full_text += page.extract_text().lower()
                        
                        # Count keyword matches
                        for keyword in pred_keywords:
                            if keyword.lower() in full_text:
                                match_count += 1
                        
                        # Only add if at least one keyword matched
                        if match_count > 0:
                            results[applicant_id] = match_count
                
                except Exception as e:
                    print(f"Error reading {filename}: {e}")
                    continue
        
        return results
    
    return search_cv(pred_keywords, directory)


    selected_CV = search_cv(pred_keywords, directory)
    return selected_CV


def update_base():
    import pandas as pd
    from sklearn.feature_extraction.text import TfidfVectorizer
    from sklearn.neighbors import NearestNeighbors
    from joblib import dump, load

    df = pd.read_csv('dataset/ug_pg.csv')

    vectorizer = TfidfVectorizer()
    X = vectorizer.fit_transform(df['UG'])

    # Train a k-NN model
    model = NearestNeighbors(n_neighbors=1, metric='cosine')
    model.fit(X)

    # Save the model and vectorizer
    dump(model, 'KNN_Model/model.joblib')
    dump(vectorizer, 'KNN_Model/vectorizer.joblib')