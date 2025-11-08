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
def registervacancy(request):
    if(request.method=='POST'):
        vacancyname=request.POST['vacancyname']
        seat=request.POST['seat']
        company=request.POST['company']
        salary=request.POST['salary']
        description=request.POST['desc']
        qual=request.POST['qualification']


        data=Vacancy(vacancyname=vacancyname,seats=seat,company=company,salary=salary,desc=description,qualification=qual)
        data.save()
     
        return redirect('staffvacancies')

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
def updatevacancy(request):
    if(request.method=='POST'):
        record_id  = request.POST['recordid']

        vacancyname=request.POST['newvacancyname']
        seat=request.POST['newseat']
        company  = request.POST['newcompany']
        salary  = request.POST['newsalary']
        desc  = request.POST['newdesc']
        qual  = request.POST['newqualification']
        print(record_id)

        record=Vacancy.objects.get(id=record_id)
        record.vacancyname = vacancyname
        record.seats = seat
        record.company = company
        record.salary  = salary
        record.desc = desc
        record.Qualification = qual
        record.save()        
        return redirect('staffvacancies')
    

def stafffilterCV(request):
    inputkey = request.POST['inputkey']
    print(inputkey)
    word_list = inputkey.split(',')
    print(f"keywords: {word_list}")
    # degree_key = word_list[0]
    # print(word_list)
    # print(degree_key)
    searchbykey = keyword_miner(word_list)
    # searchbydegree = ug_pg_miner(degree_key.upper())
    print(f"ML RESULT: {searchbykey}")
    # searchbydegree = ug_pg_miner(degree_key)
    # print(searchbykey,searchbydegree)
    apctdata = Applicant.objects.all()
    # return render(request, 'staff/welcome.html',{'apctdata':apctdata})
    return render(request, 'staff/filter applicants.html',{'apctdata':apctdata,'searchbykey':searchbykey,})
    # return render(request, 'staff/filter applicants.html',{'apctdata':apctdata,'searchbykey':searchbykey,'searchbydegree':searchbydegree,})



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

            sid=request.session['log_id'];
            apctdata=Applicant.objects.get(log_id=sid)

            # Process the data (e.g., save it to a database)
            # Your processing logic here...

            apctdata.appliedpost = request.GET['appliedpost']
            apctdata.save()
        return redirect('apctcategory')
    
    
# new views from claude

# Add this view function
def apctnotifications(request):
    if 'log_id' not in request.session:
        return redirect('login')
    
    log_id = request.session.get('log_id')
    applicant = Applicant.objects.get(log_id=log_id)
    
    # Get all applications for this applicant
    applications = Application.objects.filter(applicant=applicant).select_related('vacancy')
    
    # Group by status for better visualization
    active_applications = applications.exclude(status__in=['HIRED', 'REJECTED', 'WITHDRAWN'])
    completed_applications = applications.filter(status__in=['HIRED', 'REJECTED', 'WITHDRAWN'])
    
    context = {
        'applications': applications,
        'active_applications': active_applications,
        'completed_applications': completed_applications,
        'total_applications': applications.count(),
        'active_count': active_applications.count()
    }
    
    return render(request, 'applicant/notifications.html', context)

# Update existing applyaction view to create Application record
def applyaction(request):
    if 'log_id' not in request.session:
        return redirect('login')
    
    log_id = request.session.get('log_id')
    vacancy_id = request.POST.get('vacancy_id')
    
    applicant = Applicant.objects.get(log_id=log_id)
    vacancy = Vacancy.objects.get(id=vacancy_id)
    
    # Create Application record
    Application.objects.create(
        applicant=applicant,
        vacancy=vacancy,
        status='APPLIED'
    )
    
    return redirect('apctjoblist')

# Update staff view to change application status
from .models import Application

def viewapplicants(request):
    return render(request, 'staff/view applicants.html')

def staffviewapplicants(request):
    # Fetch all Application objects, with related Applicant and Vacancy
    applications = Application.objects.select_related('applicant', 'vacancy').all()
    return render(request, 'staff/view applicants.html', {'applications': applications})


def update_hirestatus(request):
        if request.method == 'GET':
            # Get the data from the query parameters
            hiringstatus = request.GET['hire_status']
            apctid = request.GET['apctid']
            print(hiringstatus)
            print(apctid)

            # Process the data (e.g., save it to a database)
            # Your processing logic here...

            apctdata = Applicant.objects.get(id=apctid)
            apctdata.hirestatus = hiringstatus
            apctdata.save()


        apctdata = Applicant.objects.all()
        return render(request, 'staff/view applicants.html',{'apctdata':apctdata,})

def updateapplicationstatus(request):
    if 'log_id' not in request.session:
        return redirect('login')
    
    application_id = request.POST.get('application_id')
    new_status = request.POST.get('status')
    notes = request.POST.get('notes', '')
    
    application = Application.objects.get(id=application_id)
    application.status = new_status
    if notes:
        application.notes = notes
    application.save()
    
    return redirect('staffviewapplicants')
