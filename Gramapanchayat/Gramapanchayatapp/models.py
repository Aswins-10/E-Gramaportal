from django.db import models
class amodel(models.Model):  
    sid=models.CharField(max_length=200)
    sname=models.CharField(max_length=200) 
    rid=models.IntegerField(max_length=200)
    name=models.CharField(max_length=200)
    address=models.CharField(max_length=200)
    contact=models.CharField(max_length=200)
    wardno=models.CharField(max_length=200)
    aadharno=models.CharField(max_length=200)
    gender=models.CharField(max_length=200)
    image=models.FileField(upload_to='pictures')
    dte=models.CharField(max_length=200)
    status=models.CharField(max_length=200)
    class Meta:
        db_table="tbl_applications"

class pmodel(models.Model):  
    rid=models.CharField(max_length=200)
    name=models.CharField(max_length=200) 
    wardno=models.IntegerField(max_length=200)
    dte=models.CharField(max_length=200)
    hno=models.CharField(max_length=200)
    complaint=models.CharField(max_length=200)
    image=models.FileField(upload_to='pictures')
    status=models.CharField(max_length=200)
    class Meta:
        db_table="tbl_complaint"