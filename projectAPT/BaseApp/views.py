# import functions for machine learning algorithms
from ATS import keyword_miner
from ATS import ug_pg_miner
from ATS import update_base
# basic setup
from django.shortcuts import render,redirect
from . models import *
# import these to manipulate file system operations
from django.core.files.storage import FileSystemStorage
from django.conf import settings
import os

from django.http import JsonResponse

# Create your views here.

# render pages

# primary pages
def index(request):
    return render(request, 'index.html')
def register(request):
    return render(request, 'register.html')
def login(request):
    return render(request, 'login.html')

# secondary pages (general templates)

def about(request):
    return render(request, 'about.html')
def page404(request):
    return render(request, '404.html')
def category(request):
    return render(request, 'category.html')
def contact(request):
    return render(request, 'contact.html')
def jobdetail(request):
    return render(request, 'job-detail.html')
def joblist(request):
    return render(request, 'job-list.html')
def passwordupdate(request):
    return render(request, 'password_update.html')
def profileupdate(request):
    return render(request, 'profile_update.html')
def testimonial(request):
    return render(request, 'testimonial.html')


# secondary pages (sorted for applicant)
def apctwelcome(request):
    return render(request, 'applicant/welcome.html')
def apctindex(request):
    return render(request, 'applicant/index.html')
def apctabout(request):
    return render(request, 'applicant/about.html')
def apctpage404(request):
    return render(request, 'applicant/404.html')
def apctcategory(request):
    vacancydata = Vacancy.objects.all()
    return render(request, 'applicant/category.html', {"vacancydata":vacancydata,})
def apctcontact(request):
    return render(request, 'applicant/contact.html')

def apctjoblist(request):
    return render(request, 'applicant/job-list.html')
def apctviewaccount(request):
    sid=request.session['log_id'];
    applicantprofile=Applicant.objects.get(log_id=sid)
    return render(request,'applicant/viewaccount.html',{'applicantprofile':applicantprofile})

def apctaddextradata(request):
        degree = request.POST['degree']
        xp = request.POST['xp']
        sid = request.session['log_id']
        applicantdata = Applicant.objects.get(log_id=sid)
        applicantdata.degree = degree
        applicantdata.experience = xp
        applicantdata.save()
        return render(request, 'applicant/viewaccount.html',)

def apctpasswordupdate(request):
    sid = request.session['log_id']
    applicantdata = Login.objects.get(id=sid) 
    db_pass = applicantdata.password
    return render(request, 'applicant/password_update.html',{'db_pass':db_pass,})
  
       
def apctprofileupdate(request):
    return render(request, 'applicant/profile_update.html')
def apcttestimonial(request):
    return render(request, 'applicant/testimonial.html')


# secondary pages (sorted for staff)

def staffwelcome(request):
    return render(request, 'staff/welcome.html')

def staffvacancies(request):
    vacancydata = Vacancy.objects.all()    
    return render(request, 'staff/vacancies.html',{'vacancydata':vacancydata,})

def uploadCV(request):
    if (request.method == "POST"):
        sid = request.session['log_id']
        applicantdata = Applicant.objects.get(log_id=sid)
        uploaded_file = request.FILES['CV']
        filename, file_ext = os.path.splitext(uploaded_file.name)        
        apctid = str(applicantdata.id)
        new_filename =  filename + apctid + file_ext

        upload_folder = 'cv_base'
        # set path where u want to save file with the new name
        media_path = os.path.join(settings.MEDIA_ROOT, upload_folder)

        # Rename the file and save it to the cv_base folder
        fs = FileSystemStorage(location=media_path)
        # Save the file in the current directory
        new_file_path = fs.save(os.path.join('.', new_filename), uploaded_file)


        # Assuming you have an object with the old filename saved in your database
        uploaded_cv = Applicant.objects.get(id=apctid)
        uploaded_cv.cvpath = upload_folder + '/' + new_file_path  # Update the filename with the new path
        uploaded_cv.save()

    return redirect('apctviewaccount');    

def registervacancy(request):
    if request.method == 'POST':
        vacancyname = request.POST.get('vacancyname')
        seat = request.POST.get('seat')
        company = request.POST.get('company')
        salary = request.POST.get('salary')
        content = request.POST.get('content')  # Changed from desc and qualification
        
        vacancy = Vacancy(
            vacancyname=vacancyname,
            seats=seat,
            company=company,
            salary=salary,
            content=content  # Single field
        )
        vacancy.save()
        
        messages.success(request, 'Vacancy added successfully')
        return redirect('staffvacancies')
    
    return redirect('staffvacancies')

def updatevacancy(request):
    if request.method == 'POST':
        recordid = request.POST.get('recordid')
        vacancy = Vacancy.objects.get(id=recordid)
        
        vacancy.vacancyname = request.POST.get('newvacancyname')
        vacancy.seats = request.POST.get('newseat')
        vacancy.company = request.POST.get('newcompany')
        vacancy.salary = request.POST.get('newsalary')
        vacancy.content = request.POST.get('newcontent')  # Single field
        
        vacancy.save()
        
        messages.success(request, 'Vacancy updated successfully')
        return redirect('staffvacancies')
    
    return redirect('staffvacancies')
  


def staffpage404(request):
    return render(request, 'staff/404.html')
def staffcategory(request):
    return render(request, 'staff/category.html')
def staffcontact(request):
    return render(request, 'staff/contact.html')
def staffjobdetail(request):
    return render(request, 'staff/job-detail.html')
def staffjoblist(request):
    return render(request, 'staff/job-list.html')

def staffviewaccount(request):
    sid=request.session['log_id'];
    staffprofile=Staff.objects.get(log_id=sid)
    return render(request, 'staff/viewaccount.html',{'staffprofile':staffprofile,})
def staffpasswordupdate(request):
    sid = request.session['log_id']
    staffdata = Login.objects.get(id=sid) 
    db_pass = staffdata.password
    return render(request, 'staff/password_update.html',{'db_pass':db_pass,})


def staffprofileupdate(request):
    return render(request, 'staff/profile_update.html')
def stafftestimonial(request):
    return render(request, 'staff/testimonial.html')


# render admin pages
def adminwelcome(request):
    return render(request, 'admin/welcome.html')
def adminaddstaff(request):
    staffdata = Staff.objects.all()
    return render(request,'admin/addstaff.html',{'staffdata':staffdata})


def adminpasswordupdate(request):
    sid = request.session['log_id']
    admindata = Login.objects.get(id=sid) 
    db_pass = admindata.password
    return render(request,'admin/password_update.html',{'db_pass':db_pass,})


###page functions

#admin manage staff
def registerstaff(request):
    if(request.method=='POST'):
        staffname=request.POST['staffname']
        email=request.POST['email']
        contact=request.POST['contact']
        workplace=request.POST['company']
        username=request.POST['username']
        password=request.POST['password']
        role=request.POST['role']

        if(role == 'staff'):
            login = Login(username=username,email=email,password=password,role=role)
            login.save()
            data=Staff(staffname=staffname,email=email,contact=contact,workplace=workplace,username=username,log_id=login)
            data.save()
        return redirect('adminaddstaff')
def removestaff(request):
    rowid = request.GET['delid']
    deletedata = Staff.objects.get(log_id=rowid)
    deletelogin=Login.objects.get(id=rowid)
    deletelogin.delete()
    deletedata.delete()    
    return redirect('adminaddstaff')

def removevacancy(request):
    rowid = request.GET['delid']
    deletedata = Vacancy.objects.get(id=rowid)
    deletedata.delete()    
    return redirect('staffvacancies')

def removeapct(request):
    rowid = request.GET['delid']
    deletedata = Applicant.objects.get(log_id=rowid)
    deletelogin=Login.objects.get(id=rowid)
    deletelogin.delete()
    deletedata.delete()    
    apctdata = Applicant.objects.all()
    return render(request, 'staff/view applicants.html',{'apctdata':apctdata,})

#staff update profile
def staff_update(request):
    if (request.method=="POST"):
        staffrecord=request.session['log_id'];
        # staffrecord = request.POST['staffid']
        staffname = request.POST['staffname']
        email = request.POST['email']
        contact = request.POST['contact']
        workplace = request.POST['company']
        username = request.POST['username']
        password  = request.POST['password']
        role = request.POST['role']
        # database save logic
        logindata = Login.objects.get(id=staffrecord)
        logindata.username = username
        logindata.password = password
        logindata.email = email
        logindata.role = role
        logindata.save()
        updatedata=Staff.objects.get(log_id=staffrecord)
        updatedata.staffname = staffname
        updatedata.email = email
        updatedata.contact = contact
        updatedata.workplace = workplace
        updatedata.username = username
        updatedata.save()       
    return render(request, 'staff/profile_update.html')

#applicant registration
def apct_register(request):
    if (request.method=="POST"):
        applicantname = request.POST['apctname']
        email = request.POST['email']
        contact = request.POST['contact']
        address = request.POST['address']
        username = request.POST['username']
        password  = request.POST['password']
        # hirestatus = request.POST['hirestatus']

        role = request.POST['role']
        # database save logic
        login = Login(username=username,email=email,password=password,role=role)
        login.save()
        data=Applicant(applicantname=applicantname,
                       email=email,contact=contact,address=address,
                       username=username,hirestatus= "waiting" ,cvpath="cv_base/df.pdf",
                       log_id=login)
        data.save()        
    return redirect('index')


#applicant update
def apct_update(request):
    if (request.method=="POST"):
        apctrecord=request.session['log_id']
        # apctrecord = request.POST['apctid']
        applicantname = request.POST['apctname']
        email = request.POST['email']
        contact = request.POST['contact']
        address = request.POST['address']
        username = request.POST['username']
        password  = request.POST['password']
        role = request.POST['role']
        # database save logic
        logindata = Login.objects.get(id=apctrecord)
        logindata.username = username
        logindata.password = password
        logindata.email = email
        logindata.role = role
        logindata.save()
        updatedata=Applicant.objects.get(log_id=apctrecord)
        updatedata.applicantname = applicantname
        updatedata.email = email
        updatedata.contact = contact
        updatedata.address = address
        updatedata.username = username
        updatedata.save()       
    return render(request, 'applicant/profile_update.html')




# user update privacy
def apctprivacy(request):
    if (request.method=="POST"):
            apctrecord=request.session['log_id'];
            user = request.POST['username']
            password  = request.POST['pass2']
            # database save logic
            login = Login.objects.get(id=apctrecord)
            login.password = password
            login.username = user
            login.save()
            updatedata=Applicant.objects.get(log_id=apctrecord)
            updatedata.username = user
            updatedata.save()
    return render(request, 'applicant/welcome.html',{'applicantprofile':updatedata,})   
def staffprivacy(request):
    if (request.method=="POST"):
            staffrecord=request.session['log_id'];
            user = request.POST['username']
            password  = request.POST['pass2']
            # database save logic
            login = Login.objects.get(id=staffrecord)
            login.password = password
            login.username = user
            login.save()
            updatedata=Staff.objects.get(log_id=staffrecord)
            updatedata.username = user
            updatedata.save()
    return render(request, 'staff/welcome.html',{'staffprofile':updatedata,})   
def adminprivacy(request):
    if (request.method=="POST"):
            adminrecord=request.session['log_id'];
            password  = request.POST['pass2']
            # database save logic
            login = Login.objects.get(id=adminrecord)
            login.password = password
            login.save()

    return render(request, 'admin/welcome.html',) 


#account login
def accountlogin(request):
    if(request.method=="POST"):
        username = request.POST['username']
        password = request.POST['password']
        try:
            # Try to retrieve the specific record
            logindata = Login.objects.get(username=username,password=password)
            # Use except on default exception where the object u tried to retrieve do not exist
        except Login.DoesNotExist:
            # Handle the case where the specific record is not found
            logindata = None   
               
        if(logindata!=None):
            request.session['log_id']=logindata.id
            # print(request.session['log_id'])
            if (logindata.role == "applicant"):
                applicantprofile = Applicant.objects.get(username = username, log_id=logindata.id,)
                # return redirect('apctabout')
                return render(request,'applicant/welcome.html',{'applicantprofile':applicantprofile,})
            elif (logindata.role == "staff"):
                staffprofile = Staff.objects.get(username = username, log_id=logindata.id,)
                # return redirect('staffwelcome')
                return render(request,'staff/welcome.html',{'staffprofile':staffprofile,})
            else :
                adminprofile = Login.objects.get(role=logindata.role)
                # return redirect('adminwelcome')
                return render(request,'admin/welcome.html',{'adminprofile':adminprofile,})            
                
    return render(request,'login.html',)


def apctjobdetail(request):
        if request.method == 'GET':
            # Get the data from the query parameters
            vacancyid = request.GET['vacancyid']
            print(vacancyid)

            # Process the data (e.g., save it to a database)
            # Your processing logic here...

            vdata = Vacancy.objects.get(id=vacancyid)

        return render(request, 'applicant/jobdetail.html',{'vdata':vdata,})

def jobapply(request):
        if request.method == 'GET':
            # Get the data from the query parameters

            sid=request.session['log_id']
            apctdata=Applicant.objects.get(log_id=sid)

            # Process the data (e.g., save it to a database)
            # Your processing logic here...

            apctdata.appliedpost = request.GET['appliedpost']
            apctdata.save()
        return redirect('apctcategory')
    
    
# new views from claude
# from django.shortcuts import render
# from .models import Applicant, Application, Vacancy

# def stafffilterCV(request):
#     """
#     Filter applicants by keywords using CV parsing.
#     Works with the new Application model structure.
#     """
#     if request.method == 'POST':
#         inputkey = request.POST.get('inputkey', '')
#         vacancy_id = request.POST.get('vacancy_id', None)
        
#         print(f"Input keywords: {inputkey}")
        
#         # Parse keywords
#         word_list = [word.strip() for word in inputkey.split(',') if word.strip()]
#         print(f"Parsed keywords: {word_list}")
        
#         # Run ML keyword mining - returns {applicant_id: match_count}
#         ml_results = keyword_miner(word_list)
#         print(f"ML RESULT: {ml_results}")
        
#         # Get all applicants
#         applicants = Applicant.objects.all()
        
#         # Build enriched applicant data
#         applicant_data = []
#         for applicant in applicants:
#             # Get ML match score
#             ml_score = ml_results.get(applicant.id, 0)
            
#             # Get applications for this applicant
#             if vacancy_id:
#                 applications = Application.objects.filter(
#                     applicant=applicant,
#                     vacancy_id=vacancy_id
#                 ).select_related('vacancy')
#             else:
#                 applications = Application.objects.filter(
#                     applicant=applicant
#                 ).select_related('vacancy')
            
#             # Build data dict
#             applicant_info = {
#                 'applicant': applicant,
#                 'ml_score': ml_score,
#                 'applications': applications,
#                 'total_applications': applications.count(),
#                 'has_cv': bool(applicant.cvpath),
#             }
            
#             applicant_data.append(applicant_info)
        
#         # Sort by ML score (highest first), then by name
#         applicant_data.sort(key=lambda x: (-x['ml_score'], x['applicant'].applicantname))
        
#         # Get all vacancies for filter dropdown
#         vacancies = Vacancy.objects.all()
        
#         context = {
#             'applicant_data': applicant_data,
#             'searchbykey': ml_results,  # Keep for backward compatibility
#             'vacancies': vacancies,
#             'selected_vacancy_id': vacancy_id,
#             'keywords': inputkey,
#             'total_matches': len(ml_results),
#         }
        
#         return render(request, 'staff/filter applicants.html', context)
    
#     else:
#         # GET request - show all applicants
#         applicants = Applicant.objects.all()
#         vacancies = Vacancy.objects.all()
        
#         applicant_data = []
#         for apct in applicants:
#             applications = Application.objects.filter(applicant=apct).select_related('vacancy')
#             applicant_data.append({
#                 'applicant': apct,
#                 'ml_score': 0,
#                 'applications': applications,
#                 'total_applications': applications.count(),
#                 'has_cv': bool(apct.cvpath),
#             })
        
#         context = {
#             'applicant_data': applicant_data,
#             'vacancies': vacancies,
#         }
        
#         return render(request, 'staff/filter applicants.html', context)


# # Add this view function
# def apctnotifications(request):
#     if 'log_id' not in request.session:
#         return redirect('login')
    
#     log_id = request.session.get('log_id')
#     applicant = Applicant.objects.get(log_id=log_id)
    
#     # Get all applications for this applicant
#     applications = Application.objects.filter(applicant=applicant).select_related('vacancy')
    
#     # Group by status for better visualization
#     active_applications = applications.exclude(status__in=['HIRED', 'REJECTED', 'WITHDRAWN'])
#     completed_applications = applications.filter(status__in=['HIRED', 'REJECTED', 'WITHDRAWN'])
    
#     context = {
#         'applications': applications,
#         'active_applications': active_applications,
#         'completed_applications': completed_applications,
#         'total_applications': applications.count(),
#         'active_count': active_applications.count()
#     }
    
#     return render(request, 'applicant/notifications.html', context)

# # Update existing applyaction view to create Application record
# def applyaction(request):
#     if 'log_id' not in request.session:
#         return redirect('login')
    
#     log_id = request.session.get('log_id')
#     vacancy_id = request.POST.get('vacancy_id')
    
#     applicant = Applicant.objects.get(log_id=log_id)
#     vacancy = Vacancy.objects.get(id=vacancy_id)
    
#     # Create Application record
#     Application.objects.create(
#         applicant=applicant,
#         vacancy=vacancy,
#         status='APPLIED'
#     )
    
#     return redirect('apctjoblist')

# # Update staff view to change application status
# from .models import Application

# def viewapplicants(request):
#     return render(request, 'staff/view applicants.html')

# def staffviewapplicants(request):
#     # Fetch all Application objects, with related Applicant and Vacancy
#     applications = Application.objects.select_related('applicant', 'vacancy').all()
#     return render(request, 'staff/view applicants.html', {'applications': applications})


# def update_hirestatus(request):
#         if request.method == 'GET':
#             # Get the data from the query parameters
#             hiringstatus = request.GET['hire_status']
#             apctid = request.GET['apctid']
#             print(hiringstatus)
#             print(apctid)

#             # Process the data (e.g., save it to a database)
#             # Your processing logic here...

#             apctdata = Applicant.objects.get(id=apctid)
#             apctdata.hirestatus = hiringstatus
#             apctdata.save()


#         apctdata = Applicant.objects.all()
#         return render(request, 'staff/view applicants.html',{'apctdata':apctdata,})

# def updateapplicationstatus(request):
#     if 'log_id' not in request.session:
#         return redirect('login')
    
#     application_id = request.POST.get('application_id')
#     new_status = request.POST.get('status')
#     notes = request.POST.get('notes', '')
    
#     application = Application.objects.get(id=application_id)
#     application.status = new_status
#     if notes:
#         application.notes = notes
#     application.save()
    
#     return redirect('staffviewapplicants')







from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Applicant, Application, Vacancy, Staff, Login
import os
from PyPDF2 import PdfReader


# ============================================
# ML KEYWORD MINING FUNCTION
# ============================================

def keyword_miner(pred_keywords):
    """
    Search CVs for keywords and return applicant IDs with match scores.
    Returns: dict {applicant_id: match_count}
    """
    directory = 'media/cv_base'
    results = {}
    
    def extract_applicant_id_from_filename(filename):
        """Extract applicant ID from CV filename by matching CV path."""
        try:
            applicant = Applicant.objects.filter(cvpath__icontains=filename).first()
            if applicant:
                return applicant.id
        except:
            pass
        return None
    
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


# ============================================
# STAFF VIEWS - APPLICANT MANAGEMENT
# ============================================

def stafffilterCV(request):
    """
    Filter applicants by keywords using CV parsing with ML.
    Supports vacancy filtering and ML scoring.
    """
    if request.method == 'POST':
        inputkey = request.POST.get('inputkey', '')
        vacancy_id = request.POST.get('vacancy_id', None)
        
        print(f"Input keywords: {inputkey}")
        
        # Parse keywords
        word_list = [word.strip() for word in inputkey.split(',') if word.strip()]
        print(f"Parsed keywords: {word_list}")
        
        # Run ML keyword mining - returns {applicant_id: match_count}
        ml_results = keyword_miner(word_list)
        print(f"ML RESULT: {ml_results}")
        
        # Get all applicants
        applicants = Applicant.objects.all()
        
        # Build enriched applicant data
        applicant_data = []
        for applicant in applicants:
            # Get ML match score
            ml_score = ml_results.get(applicant.id, 0)
            
            # Get applications for this applicant
            if vacancy_id:
                applications = Application.objects.filter(
                    applicant=applicant,
                    vacancy_id=vacancy_id
                ).select_related('vacancy')
            else:
                applications = Application.objects.filter(
                    applicant=applicant
                ).select_related('vacancy')
            
            # Build data dict
            applicant_info = {
                'applicant': applicant,
                'ml_score': ml_score,
                'applications': applications,
                'total_applications': applications.count(),
                'has_cv': bool(applicant.cvpath),
            }
            
            applicant_data.append(applicant_info)
        
        # Sort by ML score (highest first), then by name
        applicant_data.sort(key=lambda x: (-x['ml_score'], x['applicant'].applicantname))
        
        # Get all vacancies for filter dropdown
        vacancies = Vacancy.objects.all()
        
        context = {
            'applicant_data': applicant_data,
            'searchbykey': ml_results,
            'vacancies': vacancies,
            'selected_vacancy_id': vacancy_id,
            'keywords': inputkey,
            'total_matches': len(ml_results),
        }
        
        return render(request, 'staff/filter-applicants.html', context)
    
    else:
        # GET request - show all applicants
        applicants = Applicant.objects.all()
        vacancies = Vacancy.objects.all()
        
        applicant_data = []
        for apct in applicants:
            applications = Application.objects.filter(applicant=apct).select_related('vacancy')
            applicant_data.append({
                'applicant': apct,
                'ml_score': 0,
                'applications': applications,
                'total_applications': applications.count(),
                'has_cv': bool(apct.cvpath),
            })
        
        context = {
            'applicant_data': applicant_data,
            'vacancies': vacancies,
        }
        
        return render(request, 'staff/filter-applicants.html', context)


def staffviewapplicants(request):
    """View all applications with applicant and vacancy details."""
    applications = Application.objects.select_related(
        'applicant', 
        'vacancy'
    ).order_by('-applied_date')
    
    vacancies = Vacancy.objects.all()  # ADD THIS LINE
    
    context = {
        'applications': applications,
        'vacancies': vacancies,  # ADD THIS LINE
    }
    
    return render(request, 'staff/view-applicants.html', context)



def update_application_status(request):
    """Update the status of an application."""
    if request.method == 'POST':
        application_id = request.POST.get('application_id')
        new_status = request.POST.get('status')
        notes = request.POST.get('notes', '')
        
        try:
            application = Application.objects.get(id=application_id)
            application.status = new_status
            if notes:
                application.notes = notes
            application.save()
            messages.success(request, 'Application status updated successfully')
        except Application.DoesNotExist:
            messages.error(request, 'Application not found')
        except Exception as e:
            messages.error(request, f'Error updating status: {str(e)}')
    
    # Get the referrer to redirect back
    referrer = request.META.get('HTTP_REFERER')
    if referrer and 'filtercv' in referrer.lower():
        return redirect('stafffilterCV')
    else:
        return redirect('staffviewapplicants')


def remove_applicant(request):
    """Remove/delete an applicant from the system (handles both old and new formats)."""
    
    # Handle both GET (old format) and POST (new format)
    if request.method == 'GET':
        applicant_id = request.GET.get('delid')  # Old format
    else:  # POST
        applicant_id = request.POST.get('applicant_id')  # New format
    
    if not applicant_id:
        messages.error(request, 'No applicant specified for removal')
        return redirect('staffviewapplicants')
    
    try:
        applicant = get_object_or_404(Applicant, id=applicant_id)
        applicant_name = applicant.applicantname
        
        # Delete the applicant (cascade will delete related applications)
        applicant.delete()
        
        messages.success(request, f'Applicant {applicant_name} has been removed successfully')
    except Exception as e:
        messages.error(request, f'Error removing applicant: {str(e)}')
    
    # Get the referrer to redirect back
    referrer = request.META.get('HTTP_REFERER', '')
    if 'filtercv' in referrer.lower() or 'filter' in referrer.lower():
        return redirect('stafffilterCV')
    else:
        return redirect('staffviewapplicants')


# ============================================
# APPLICANT VIEWS
# ============================================

def apctnotifications(request):
    """View application status notifications for logged-in applicant."""
    if 'log_id' not in request.session:
        return redirect('login')
    
    log_id = request.session.get('log_id')
    try:
        applicant = Applicant.objects.get(log_id=log_id)
    except Applicant.DoesNotExist:
        messages.error(request, 'Applicant not found')
        return redirect('login')
    
    # Get all applications for this applicant
    applications = Application.objects.filter(
        applicant=applicant
    ).select_related('vacancy').order_by('-applied_date')
    
    # Group by status for better visualization
    active_applications = applications.exclude(
        status__in=['HIRED', 'REJECTED', 'WITHDRAWN']
    )
    completed_applications = applications.filter(
        status__in=['HIRED', 'REJECTED', 'WITHDRAWN']
    )
    
    context = {
        'applications': applications,
        'active_applications': active_applications,
        'completed_applications': completed_applications,
        'total_applications': applications.count(),
        'active_count': active_applications.count()
    }
    
    return render(request, 'applicant/notifications.html', context)


def applyaction(request):
    """Handle job application submission."""
    if 'log_id' not in request.session:
        messages.error(request, 'Please login to apply for jobs')
        return redirect('login')
    
    if request.method == 'POST':
        log_id = request.session.get('log_id')
        vacancy_id = request.POST.get('vacancy_id')
        
        try:
            applicant = Applicant.objects.get(log_id=log_id)
            vacancy = Vacancy.objects.get(id=vacancy_id)
            
            # Check if already applied by checking appliedpost field
            if applicant.appliedpost and str(vacancy_id) in applicant.appliedpost:
                messages.warning(request, f'You have already applied for {vacancy.vacancyname}')
            else:
                # Append to appliedpost field (comma-separated IDs)
                if applicant.appliedpost:
                    applicant.appliedpost += f",{vacancy_id}"
                else:
                    applicant.appliedpost = str(vacancy_id)
                
                applicant.save()
                messages.success(request, f'Successfully applied for {vacancy.vacancyname}!')
        
        except Applicant.DoesNotExist:
            messages.error(request, 'Applicant not found')
        except Vacancy.DoesNotExist:
            messages.error(request, 'Job vacancy not found')
        except Exception as e:
            messages.error(request, 'Error submitting application')
            print(f"Error: {str(e)}")
    
    return redirect('apctcategory')

def withdraw_application(request):
    """Allow applicant to withdraw their application."""
    if 'log_id' not in request.session:
        messages.error(request, 'Please login first')
        return redirect('login')
    
    if request.method == 'POST':
        application_id = request.POST.get('application_id')
        
        try:
            log_id = request.session.get('log_id')
            applicant = Applicant.objects.get(log_id=log_id)
            
            # Get application and verify ownership
            application = Application.objects.get(
                id=application_id,
                applicant=applicant
            )
            
            # Can only withdraw if status is APPLIED, UNDER_REVIEW, or SHORTLISTED
            if application.status in ['APPLIED', 'UNDER_REVIEW', 'SHORTLISTED']:
                application.status = 'WITHDRAWN'
                application.save()
                messages.success(request, f'Application for {application.vacancy.vacancyname} withdrawn successfully')
            else:
                messages.warning(request, 'This application cannot be withdrawn')
        
        except Application.DoesNotExist:
            messages.error(request, 'Application not found')
        except Applicant.DoesNotExist:
            messages.error(request, 'Applicant not found')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    
    return redirect('apctnotifications')


def delete_application(request):
    """Delete application (only for WITHDRAWN or REJECTED status)."""
    if 'log_id' not in request.session:
        messages.error(request, 'Please login first')
        return redirect('login')
    
    if request.method == 'POST':
        application_id = request.POST.get('application_id')
        
        try:
            log_id = request.session.get('log_id')
            applicant = Applicant.objects.get(log_id=log_id)
            
            # Get application and verify ownership
            application = Application.objects.get(
                id=application_id,
                applicant=applicant
            )
            
            # Can only delete if status is WITHDRAWN or REJECTED
            if application.status in ['WITHDRAWN', 'REJECTED']:
                vacancy_name = application.vacancy.vacancyname
                application.delete()
                messages.success(request, f'Application for {vacancy_name} deleted successfully')
            else:
                messages.warning(request, 'Only withdrawn or rejected applications can be deleted')
        
        except Application.DoesNotExist:
            messages.error(request, 'Application not found')
        except Applicant.DoesNotExist:
            messages.error(request, 'Applicant not found')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    
    return redirect('apctnotifications')



# ============================================
# LEGACY/COMPATIBILITY VIEWS (Keep if needed)
# ============================================

def viewapplicants(request):
    """Legacy view - redirects to staff view applicants."""
    return redirect('staffviewapplicants')
