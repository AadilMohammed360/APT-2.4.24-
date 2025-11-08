from django.db import models
import os

# Create your models here.
class Login(models.Model):
    role = models.CharField(max_length=15)
    username = models.CharField(max_length=20, null=True)
    email = models.CharField(max_length=30)
    password = models.CharField(max_length=20)

class Applicant(models.Model):
    applicantname = models.CharField(max_length=20)
    email = models.CharField(max_length=50)
    contact = models.BigIntegerField()
    address = models.TextField()
    username = models.CharField(max_length=20)
    degree = models.CharField(max_length=20, null=True)
    experience = models.CharField(max_length=20, null=True)
    hirestatus = models.CharField(max_length=20, null=True)
    appliedpost = models.CharField(max_length=100, null=True)
    

    
    cvpath  = models.FileField(upload_to='cv_base/', null=True)
    log_id = models.ForeignKey(Login, on_delete=models.CASCADE, null=True)

class Staff(models.Model):
    staffname = models.CharField(max_length=20)
    email = models.CharField(max_length=50)
    contact = models.BigIntegerField()
    workplace = models.CharField(max_length=50)
    username = models.CharField(max_length=20)

    log_id = models.ForeignKey(Login, on_delete=models.CASCADE, null=True)

class Vacancy(models.Model):
    vacancyname = models.CharField(max_length=50)
    salary = models.CharField(max_length=30, null=True)
    company = models.CharField(max_length=30, null=True)
    desc = models.TextField(max_length=150, null=True)
    qualification = models.TextField(max_length=150, null=True)
    seats = models.BigIntegerField()
