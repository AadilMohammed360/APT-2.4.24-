
from django.urls import path
from . import views

urlpatterns = [
    

    # render template pages
    path('', views.index, name="index"),
    path('about', views.about, name="about"),
    path('404', views.page404, name="page404"),
    path('category', views.category, name="category"),
    path('contact', views.contact, name="contact"),
    path('jobdetail', views.jobdetail, name="jobdetail"),
    path('joblist', views.joblist, name="joblist"),
    path('login', views.login, name="login"),
    path('passwordupdate', views.passwordupdate, name="passwordupdate"),
    path('profileupdate', views.profileupdate, name="profileupdate"),
    path('register', views.register, name="register"),
    path('testimonial', views.testimonial, name="testimonial"),
    path('viewapplicants', views.viewapplicants, name="viewapplicants"),

    # render applicant pages
    path('apct/about', views.apctabout, name="apctabout"),
    path('apct/welcome', views.apctwelcome, name="apctwelcome"),
    path('apct/index', views.apctindex, name="apctindex"),
    path('apct/viewaccount', views.apctviewaccount, name="apctviewaccount"),
    path('apct/apctaddextradata', views.apctaddextradata, name="apctaddextradata"),
    path('apct/uploadCV', views.uploadCV, name="uploadCV"),
    path('apct/404', views.apctpage404, name="apctpage404"),
    path('apct/category', views.apctcategory, name="apctcategory"),
    path('apct/contact', views.apctcontact, name="apctcontact"),
    path('apct/jobdetail', views.apctjobdetail, name="apctjobdetail"),
    path('apct/joblist', views.apctjoblist, name="apctjoblist"),
    path('apct/passwordupdate', views.apctpasswordupdate, name="apctpasswordupdate"),
    path('apct/profileupdate', views.apctprofileupdate, name="apctprofileupdate"),
    path('apct/testimonial', views.apcttestimonial, name="apcttestimonial"),
    # path('update_hirestatus/', views.update_hirestatus, name="update_hirestatus"),
    path('apct/jobapply', views.jobapply, name="jobapply"),

    #render staff pages
    path('staff/welcome',views.staffwelcome,name="staffwelcome"),
    path('staff/registervacancy',views.registervacancy,name="registervacancy"),
    path('staff/updatevacancy',views.updatevacancy,name="updatevacancy"),
    path('staff/staffvacancies',views.staffvacancies,name="staffvacancies"),
    path('staff/stafffilterCV',views.stafffilterCV,name="stafffilterCV"),
    path('staff/404',views.staffpage404,name="staffpage404"),
    path('staff/category',views.staffcategory,name="staffcategory"),
    path('staff/contact',views.staffcontact,name="staffcontact"),
    path('staff/job-detail',views.staffjobdetail,name="staffjobdetail"),
    path('staff/job-list',views.staffjoblist,name="staffjoblist"),
    path('staff/viewaccount',views.staffviewaccount,name="staffviewaccount"),
    path('staff/password_update',views.staffpasswordupdate,name="staffpasswordupdate"),
    path('staff/profile_update',views.staffprofileupdate,name="staffprofileupdate"),
    path('staff/testimonial',views.stafftestimonial,name="stafftestimonial"),
    path('staff/view applicants',views.staffviewapplicants,name="staffviewapplicants"),

    #render admin pages
    path('administrator/welcome', views.adminwelcome, name="adminwelcome"),    
    path('administrator/addstaff', views.adminaddstaff, name="adminaddstaff"),
    path('administrator/registerstaff', views.registerstaff, name="registerstaff"),
    path('administrator/removestaff', views.removestaff, name="removestaff"),
    path('apct/removeapct', views.removeapct, name="removeapct"),
    path('staff/removevacancy', views.removevacancy, name="removevacancy"),
    path('administrator/passwordupdate', views.adminpasswordupdate, name="adminpasswordupdate"),

    #  applicant_registration
    path('apct_register', views.apct_register, name="apct_register"),
    #applicant updation
    path('apct_update', views.apct_update, name="apct_update"),
    #applicant updation
    path('apctprivacy', views.apctprivacy, name="apctprivacy"),    
    path('staffprivacy', views.staffprivacy, name="staffprivacy"),
    path('adminprivacy', views.adminprivacy, name="adminprivacy"),
    #staff updation
    path('staff_update', views.staff_update, name="staff_update"),
    #account login
    path('accountlogin', views.accountlogin, name="accountlogin"),
    
    # Add this to urlpatterns
    path('apct/notifications', views.apctnotifications, name="apctnotifications"),
    path('staff/updatestatus', views.updateapplicationstatus, name="updateapplicationstatus"),
    
]
