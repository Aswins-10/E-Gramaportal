from django import forms
from django.forms import CharField
from Gramapanchayatapp.models import amodel,pmodel


class aform(forms.Form):
    sid=forms.CharField(max_length=100)
    sname=forms.CharField(max_length=100)
    rid=forms.CharField(max_length=20)
    name=forms.CharField(max_length=100)
    address=forms.CharField(max_length=100)
    contact=forms.CharField(max_length=100)
    wardno=forms.CharField(max_length=100)
    aadharno=forms.CharField(max_length=100)
    gender=forms.CharField(max_length=100)
    image=forms.FileField()
    dte=forms.CharField(max_length=100)
    status=forms.CharField(max_length=100)
    class Meta:
        model = amodel
        fields = ['sid','sname','rid','name','address','contact','wardno','aadharno','gender','image','dte','status']

class pform(forms.Form):
    rid=forms.CharField(max_length=100)
    name=forms.CharField(max_length=100)
    wardno=forms.CharField(max_length=20)
    dte=forms.CharField(max_length=100)
    hno=forms.CharField(max_length=100)
    complaint=forms.CharField(max_length=100)
    
    image=forms.FileField()
    status=forms.CharField(max_length=100)
    class Meta:
        model = pmodel
        fields = ['rid','name','wardno','dte','hno','complaint','image','status']