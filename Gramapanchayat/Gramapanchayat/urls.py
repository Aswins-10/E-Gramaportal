"""Gramapanchayat URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from Gramapanchayatapp.views import *
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',index,name='index'),
	path('index/',index,name='index'),
    path('user/',user,name='user'),
    path('useraction/',useraction,name='useraction'),
    path('login/',login,name='login'),
    path('loginaction/',loginaction,name='loginaction'),
    path('adminhome/',adminhome,name='adminhome'),
    path('scheme/',scheme,name='scheme'),
    path('schemeaction/',schemeaction,name='schemeaction'),
    path('sdelete/',sdelete,name='sdelete'),
    path('sedit/',sedit,name='sedit'),
    path('seditaction/',seditaction,name='seditaction'),
    path('notice/',notice,name='notice'),
    path('noticeaction/',noticeaction,name='noticeaction'),
    path('ndelete/',ndelete,name='ndelete'),
    path('staff/',staff,name='staff'),
    path('staffaction/',staffaction,name='staffaction'),
    path('stdelete/',stdelete,name='stdelete'),
    path('viewusers/',viewusers,name='viewusers'),
    path('userhome/',userhome,name='userhome'),
    path('viewscheme/',viewscheme,name='viewscheme'),
    path('application/',application,name='application'),
    path('applicationaction/',applicationaction,name='applicationaction'),
    path('viewnotice/',viewnotice,name='viewnotice'),
    path('feedback/',feedback,name='feedback'),
    path('feedbackaction/',feedbackaction,name='feedbackaction'),
    path('complaint/',complaint,name='complaint'),
    path('complaintaction/',complaintaction,name='complaintaction'),
    path('viewapstatus/',viewapstatus,name='viewapstatus'),
    path('viewcstatus/',viewcstatus,name='viewcstatus'),
    path('myprofile/',myprofile,name='myprofile'),
    path('profileaction/',profileaction,name='profileaction'),
    path('viewcomplaints/',viewcomplaints,name='viewcomplaints'),
    path('approve/',approve,name='approve'),
    path('reject/',reject,name='reject'),
    path('assignstaff/',assignstaff,name='assignstaff'),
    path('assignaction/',assignaction,name='assignaction'),
    path('viewfeedback/',viewfeedback,name='viewfeedback'),
    path('staffhome/',staffhome,name='staffhome'),
    path('viewapplication/',viewapplication,name='viewapplication'),
    path('apr/',apr,name='apr'),
    path('rej/',rej,name='rej'),
    path('viewacomplaints/',viewacomplaints,name='viewacomplaints'),
    path('solution/',solution,name='solution'),
    path('solutionaction/',solutionaction,name='solutionaction'),
    path('myprofile1/',myprofile1,name='myprofile1'),
    path('mprofileaction/',mprofileaction,name='mprofileaction'),
       
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += staticfiles_urlpatterns()

