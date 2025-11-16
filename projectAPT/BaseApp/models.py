from django.db import models
import os

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
    cvpath = models.FileField(upload_to='cv_base/', null=True)
    log_id = models.ForeignKey(Login, on_delete=models.CASCADE, null=True)
    # Remove: hirestatus, appliedpost (moved to Application model)

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
    
    # SINGLE FIELD for all job detail page content (replaces desc and qualification)
    content = models.TextField(null=True, blank=True)
    
    seats = models.BigIntegerField()

    def __str__(self):
        return self.vacancyname

# NEW MODEL for tracking applications
class Application(models.Model):
    STATUS_CHOICES = [
        ('NOT_APPLIED', 'Not Applied'),
        ('APPLIED', 'Application Submitted'),
        ('UNDER_REVIEW', 'Under Review'),
        ('SHORTLISTED', 'Shortlisted'),
        ('LEVEL_1_SCHEDULED', 'Level 1 Interview Scheduled'),
        ('LEVEL_1_COMPLETED', 'Level 1 Interview Completed'),
        ('LEVEL_2_SCHEDULED', 'Level 2 Interview Scheduled'),
        ('LEVEL_2_COMPLETED', 'Level 2 Interview Completed'),
        ('LEVEL_3_SCHEDULED', 'Level 3 Interview Scheduled'),
        ('LEVEL_3_COMPLETED', 'Level 3 Interview Completed'),
        ('HR_ROUND', 'HR Round'),
        ('OFFER_EXTENDED', 'Offer Extended'),
        ('HIRED', 'Hired'),
        ('REJECTED', 'Rejected'),
        ('WITHDRAWN', 'Application Withdrawn')
    ]
    
    applicant = models.ForeignKey(Applicant, on_delete=models.CASCADE, related_name='applications')
    vacancy = models.ForeignKey(Vacancy, on_delete=models.CASCADE, related_name='applications')
    applied_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=30, choices=STATUS_CHOICES, default='APPLIED')
    status_updated_date = models.DateTimeField(auto_now=True)
    notes = models.TextField(null=True, blank=True)  # Staff can add notes
    ml_score = models.FloatField(null=True, blank=True)  # Store ML ranking score
    
    class Meta:
        unique_together = ('applicant', 'vacancy')  # One application per vacancy
        ordering = ['-applied_date']
    
    def __str__(self):
        return f"{self.applicant.applicantname} - {self.vacancy.vacancyname} - {self.status}"
