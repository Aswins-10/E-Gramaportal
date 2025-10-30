from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render,HttpResponseRedirect,redirect
from django.db import connection
from Gramapanchayatapp.models import amodel,pmodel
from Gramapanchayatapp.forms import aform,pform
from datetime import date
def index(request):
    return render(request,'index.html')
def user(request):
    return render(request,'user.html')
def useraction(request):
    cursor=connection.cursor()
    n=request.GET['name']
    e=request.GET['email']
    a=request.GET['aadhar']
    c=request.GET['contact']
    w=request.GET['wardno']
    p=request.GET['upass']
    adr=request.GET['address']
    sq="insert into tbl_user(name,email,aadhar,cno,wardno,address)values('%s','%s','%s','%s','%s','%s')"%(n,e,a,c,w,adr)
    cursor.execute(sq)
    sql="select max(rid) as uid from tbl_user"
    cursor.execute(sql)
    rs=cursor.fetchall()
    for rw in rs:
        q="insert into tbl_login(uid,uname,upass,utype)values('%s','%s','%s','User')"%(rw[0],e,p)
        cursor.execute(q)
        msg="<script>alert('Successfully Registered');window.location='/login/';</script>"
    return HttpResponse(msg)
def login(request):
    return render(request,'login.html')
def loginaction(request):
    cursor=connection.cursor()
    p=request.GET['uname']
    q=request.GET['upass']
    sql2="select* from tbl_login where uname='%s'and upass='%s'"%(p,q)
    cursor.execute(sql2)
    rs=cursor.fetchall()
    if(cursor.rowcount)>0:
        sql3="select * from tbl_login where uname='%s' and upass='%s'"%(p,q)
        cursor.execute(sql3)
        rsl=cursor.fetchall()
        for rowl in rsl:
            request.session['uid']=rowl[1]
            request.session['utype']=rowl[4]
        if(request.session['utype']=='admin'):
            return render(request,'adminhome.html')
        elif(request.session['utype']=='User'): 
            return render(request,'userhome.html')
        elif(request.session['utype']=='Staff'): 
            return render(request,'staffhome.html')
        else:
            return render(request,'index.html')
    else:
        html="<script>alert('invalid password and username');window.location='/login/';</script>"
        return HttpResponse(html)
def adminhome(request):
    return render(request,'adminhome.html')
def scheme(request):
    cursor=connection.cursor()
    sql="select * from tbl_scheme"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'sid':rw[0],'sname':rw[1],'category':rw[2],'dte':rw[3],'sdetails':rw[4]}
        cr.append(x)
    return render(request,'scheme.html',{'cr':cr})
def schemeaction(request):
    cursor=connection.cursor()
    n=request.GET['sname']
    c=request.GET['category']
    d=request.GET['date']
    s=request.GET['sdetails']
    sql="insert into tbl_scheme(sname,category,dte,sdetails)values('%s','%s','%s','%s')"%(n,c,d,s)
    cursor.execute(sql)
    html="<script>alert('Successfully Added');window.location='/scheme/';</script>"
    return HttpResponse(html)
def sdelete(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="delete from tbl_scheme where sid='%s'"%(id)
    cursor.execute(sql)
    html="<script>alert('Deleted');window.location='/scheme/';</script>"
    return HttpResponse(html)
def sedit(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="select * from tbl_scheme where sid='%s'"%(id)
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'sid':rw[0],'sname':rw[1],'category':rw[2],'dte':rw[3],'sdetails':rw[4]}
        cr.append(x)
    return render(request,'sedit.html',{'cr':cr})
def seditaction(request):
    cursor=connection.cursor()
    id=request.GET['id']
    c=request.GET['category']
    d=request.GET['date']
    s=request.GET['sdetails']
    sql="update tbl_scheme set category='%s',dte='%s',sdetails='%s' where sid='%s'"%(c,d,s,id)
    cursor.execute(sql)
    html="<script>alert('Updated');window.location='/scheme/';</script>"
    return HttpResponse(html)
def notice(request):
    cursor=connection.cursor()
    sql="select * from tbl_notice"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'nid':rw[0],'subject':rw[1],'dte':rw[2],'details':rw[3]}
        cr.append(x)
    return render(request,'notice.html',{'cr':cr})
def noticeaction(request):
    cursor=connection.cursor()
    s=request.GET['sname']
    d=request.GET['date']
    nd=request.GET['sdetails']
    sql="insert into tbl_notice(subject,dte,details)values('%s','%s','%s')"%(s,d,nd)
    cursor.execute(sql)
    html="<script>alert('Added');window.location='/notice/';</script>"
    return HttpResponse(html)
def ndelete(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="delete from tbl_notice where nid='%s'"%(id)
    cursor.execute(sql)
    html="<script>alert('Delete');window.location='notice/';</script>"
    return HttpResponse(html)
def staff(request):
    cursor=connection.cursor()
    sql="select * from tbl_staff"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'sid':rw[0],'name':rw[1],'email':rw[2],'idno':rw[3],'contact':rw[4],'designation':rw[5]}
        cr.append(x)
    return render(request,'staff.html',{'cr':cr})
def staffaction(request):
    cursor=connection.cursor()
    n=request.GET['name']
    e=request.GET['email']
    i=request.GET['idno']
    c=request.GET['contact']
    d=request.GET['designation']
    p=request.GET['upass']
    sql="insert into tbl_staff(name,email,idno,contact,designation)values('%s','%s','%s','%s','%s')"%(n,e,i,c,d)
    cursor.execute(sql)
    sq="select max(sid) as uid from tbl_staff"
    cursor.execute(sq)
    rs=cursor.fetchall()
    for rw in rs:
        q="insert into tbl_login(uid,uname,upass,utype)values('%s','%s','%s','Staff')"%(rw[0],e,p)
        cursor.execute(q)
        html="<script>alert('Successfully Added');window.location='/staff/';</script>"
    return HttpResponse(html)
def stdelete(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="delete from tbl_staff where sid='%s'"%(id)
    cursor.execute(sql)
    html="<script>alert('Deleted');window.location='/staff/';</script>"
    return HttpResponse(html)
def viewusers(request):
    cursor=connection.cursor()
    sq="select * from tbl_user"
    cursor.execute(sq)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'rid':rw[0],'name':rw[1],'email':rw[2],'aadhar':rw[3],'cno':rw[4],'wardno':rw[5],'address':rw[6]}
        cr.append(x)
    return render(request,'viewusers.html',{'cr':cr})
def userhome(request):
    return render(request,'userhome.html')
def viewscheme(request):
    cursor=connection.cursor()
    sql="select * from tbl_scheme"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'sid':rw[0],'sname':rw[1],'category':rw[2],'dte':rw[3],'sdetails':rw[4]}
        cr.append(x)
    return render(request,'viewscheme.html',{'cr':cr})
def application(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    id=request.GET['id']
    sql="select * from tbl_scheme where sid='%s'"%(id)
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'sid':rw[0],'sname':rw[1],'category':rw[2],'dte':rw[3],'sdetails':rw[4]}
        cr.append(x)
    sq="select * from tbl_user where rid='%s'"%(uid)
    cursor.execute(sq)
    ct=[]
    rt=cursor.fetchall()
    for r in rt:
        y={'rid':r[0],'name':r[1],'email':r[2],'aadhar':r[3],'cno':r[4],'wardno':r[5],'address':r[6]}
        ct.append(y)
    return render(request,'application.html',{'cr':cr,'ct':ct})
def applicationaction(request):
    if request.method == "POST": 
        MyProfileForm = aform(request.POST, request.FILES)
        if MyProfileForm.is_valid():
            profile = amodel()
            profile.sid=request.POST["sid"]
            profile.sname=request.POST["sname"]
            profile.rid=request.POST["rid"]
            profile.name=request.POST["name"]
            profile.address=request.POST["address"]
            profile.contact=request.POST["contact"]
            profile.wardno=request.POST["wardno"]
            profile.aadharno=request.POST["aadharno"]
            profile.gender=request.POST["gender"]
            profile.image=MyProfileForm.cleaned_data["image"]
            profile.dte=request.POST["dte"]
            profile.status=request.POST["status"]
            profile.save()   
            rhs="<script>alert('Added');window.location='/userhome/';</script>"
            saved = True
    else:
        Engform = profileform()
    return HttpResponse(rhs) 
def viewnotice(request):
    cursor=connection.cursor()
    sql="select * from tbl_notice"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'nid':rw[0],'subject':rw[1],'dte':rw[2],'details':rw[3]}
        cr.append(x)
    return render(request,'viewnotice.html',{'cr':cr})
def feedback(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sq="select * from tbl_user where rid='%s'"%(uid)
    cursor.execute(sq)
    ct=[]
    rt=cursor.fetchall()
    for r in rt:
        y={'rid':r[0],'name':r[1],'email':r[2],'aadhar':r[3],'cno':r[4],'wardno':r[5],'address':r[6]}
        ct.append(y)
    return render(request,'feedback.html',{'ct':ct})
def feedbackaction(request):
    cursor=connection.cursor()
    rid=request.GET['rid']
    n=request.GET['name']
    d=request.GET['dte']
    dt=request.GET['details']
    dte=date.today()
    sql="insert into tbl_feedback(rid,name,dte,details,fdte)values('%s','%s','%s','%s','%s')"%(rid,n,d,dt,dte)
    cursor.execute(sql)
    msg="<script>alert('Added');window.location='/feedback/';</script>"
    return HttpResponse(msg)
def complaint(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sq="select * from tbl_user where rid='%s'"%(uid)
    cursor.execute(sq)
    ct=[]
    rt=cursor.fetchall()
    for r in rt:
        y={'rid':r[0],'name':r[1],'email':r[2],'aadhar':r[3],'cno':r[4],'wardno':r[5],'address':r[6]}
        ct.append(y)
    return render(request,'complaint.html',{'ct':ct})
def complaintaction(request):
    if request.method == "POST": 
        MyProfileForm = pform(request.POST, request.FILES)
        if MyProfileForm.is_valid():
            profile = pmodel()
            profile.rid=request.POST["rid"]
            profile.name=request.POST["name"]
            profile.wardno=request.POST["wardno"]
            profile.dte=request.POST["dte"]
            profile.hno=request.POST["hno"]
            profile.complaint=request.POST["complaint"]
            profile.image=MyProfileForm.cleaned_data["image"]
            profile.status=request.POST["status"]
            profile.save()   
            rhs="<script>alert('Added');window.location='/userhome/';</script>"
            saved = True
    else:
        Engform = profileform()
    return HttpResponse(rhs) 
def viewapstatus(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sql="select * from tbl_applications where rid='%s'"%(uid)
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'aid':rw[0],'sid':rw[1],'sname':rw[2],'rid':rw[3],'name':rw[4],'address':rw[5],'contact':rw[6],'wardno':rw[7],'aadharno':rw[8],'gender':rw[9],'image':rw[10],'dte':rw[11],'status':rw[12]}
        cr.append(x)
    return render(request,'viewapstatus.html',{'cr':cr})
def viewcstatus(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sql="select * from tbl_complaint inner join  tbl_solutions on tbl_solutions.cid=tbl_complaint.cid where tbl_complaint.rid='%s'"%(uid)
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'cid':r[0],'rid':r[1],'name':r[2],'wardno':r[3],'dte':r[4],'hno':r[5],'complaint':r[6],'image':r[7],'status':r[8],'solution':r[13]}
        cr.append(x)
    return render(request,'viewcstatus.html',{'cr':cr})
def myprofile(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sq="select * from tbl_user where rid='%s'"%(uid)
    cursor.execute(sq)
    ct=[]
    rt=cursor.fetchall()
    for r in rt:
        y={'rid':r[0],'name':r[1],'email':r[2],'aadhar':r[3],'cno':r[4],'wardno':r[5],'address':r[6]}
        ct.append(y)
    return render(request,'myprofile.html',{'ct':ct})
def profileaction(request):
    cursor=connection.cursor()
    rid=request.GET['rid']
    a=request.GET['address']
    c=request.GET['contact']
    w=request.GET['wardno']
    e=request.GET['email']
    sql="update tbl_user set address='%s',cno='%s',wardno='%s',email='%s' where rid='%s'"%(a,c,w,e,rid)
    cursor.execute(sql)
    msg="<script>alert('Edited Successfully');window.location='/userhome/';</script>"
    return HttpResponse(msg)
def viewcomplaints(request):
    cursor=connection.cursor()
    sql="select * from tbl_complaint "
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'cid':r[0],'rid':r[1],'name':r[2],'wardno':r[3],'dte':r[4],'hno':r[5],'complaint':r[6],'image':r[7],'status':r[8]}
        cr.append(x)
    return render(request,'viewcomplaints.html',{'cr':cr})
def approve(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="update tbl_complaint set status='Approved' where cid='%s'"%(id)
    cursor.execute(sql)
    msg="<script>alert('Approved Successfully');window.location='/viewcomplaints/';</script>"
    return HttpResponse(msg)
def reject(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="update tbl_complaint set status='Rejected' where cid='%s'"%(id)
    cursor.execute(sql)
    msg="<script>alert('Rejected Successfully');window.location='/viewcomplaints/';</script>"
    return HttpResponse(msg)
def assignstaff(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="select * from tbl_staff"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'sid':r[0],'name':r[1],'email':r[2],'idno':r[3],'contact':r[4],'designation':r[5]}
        cr.append(x)
    return render(request,'assignstaff.html',{'cr':cr,'id':id})
def assignaction(request):
    cursor=connection.cursor()
    dte=date.today()
    cid=request.GET['cid']
    sid=request.GET['sid']
    n=request.GET['name']
    sql="insert into tbl_assign(cid,sid,name,dte)values('%s','%s','%s','%s')"%(cid,sid,n,dte)
    cursor.execute(sql)
    msg="<script>alert('Successfully Assigned');window.location='/viewcomplaints/';</script>"
    return HttpResponse(msg)
def viewfeedback(request):
    cursor=connection.cursor()
    sql="select * from tbl_feedback"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'fid':r[0],'rid':r[1],'name':r[2],'dte':r[3],'details':r[4],'fdte':r[5]}
        cr.append(x)
    return render(request,'viewfeedback.html',{'cr':cr})
def staffhome(request):
    return render(request,'staffhome.html')
def viewapplication(request):
    cursor=connection.cursor()
    sql="select * from tbl_applications"
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for rw in rs:
        x={'aid':rw[0],'sid':rw[1],'sname':rw[2],'rid':rw[3],'name':rw[4],'address':rw[5],'contact':rw[6],'wardno':rw[7],'aadharno':rw[8],'gender':rw[9],'image':rw[10],'dte':rw[11],'status':rw[12]}
        cr.append(x)
    return render(request,'viewapplication.html',{'cr':cr})
def rej(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sq="update tbl_applications set status='Rejected' where aid='%s'"%(id)
    cursor.execute(sq)
    msg="<script>alert('Rejected Successfully');window.location='/viewapplication/';</script>"
    return HttpResponse(msg)
def apr(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sq="update tbl_applications set status='Approved' where aid='%s'"%(id)
    cursor.execute(sq)
    msg="<script>alert('Approved Successfully');window.location='/viewapplication/';</script>"
    return HttpResponse(msg)
def viewacomplaints(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sq="select * from tbl_assign inner join tbl_complaint on tbl_complaint.cid=tbl_assign.cid where tbl_assign.sid='%s'"%(uid)
    cursor.execute(sq)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'cid':r[0],'rid':r[1],'name':r[2],'wardno':r[3],'dte':r[4],'hno':r[5],'complaint':r[6],'image':r[7],'status':r[8],'asid':r[9],'sid':r[11],'name':r[12]}
        cr.append(x)
    return render(request,'viewacomplaints.html',{'cr':cr})
def solution(request):
    cursor=connection.cursor()
    id=request.GET['id']
    sql="select * from tbl_assign where asid='%s'"%(id)
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'asid':r[0],'cid':r[1],'name':r[3],'dte':r[4]}
        cr.append(x)
    return render(request,'solution.html',{'cr':cr})
def solutionaction(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    cid=request.GET['cid']
    asid=request.GET['asid']
    s=request.GET['solution']
    d=date.today()
    sql="insert into tbl_solutions(sid,cid,asid,solution,dte)values('%s','%s','%s','%s','%s')"%(uid,cid,asid,s,d)
    cursor.execute(sql)
    msg="<script>alert('Added');window.location='/staffhome/';</script>"
    return HttpResponse(msg)
def myprofile1(request):
    cursor=connection.cursor()
    uid=request.session['uid']
    sql="select * from tbl_staff where sid='%s'"%(uid)
    cursor.execute(sql)
    cr=[]
    rs=cursor.fetchall()
    for r in rs:
        x={'sid':r[0],'name':r[1],'email':r[2],'idno':r[3],'contact':r[4],'designation':r[5]}
        cr.append(x)
    return render(request,'myprofile1.html',{'cr':cr})
def mprofileaction(request):
    cursor=connection.cursor()
    id=request.GET['rid']
    c=request.GET['contact']
    i=request.GET['idno']
    e=request.GET['email']
    sq="update tbl_staff set contact='%s',email='%s',idno='%s' where sid='%s'"%(c,e,i,id)
    cursor.execute(sq)
    msg="<script>alert('Updated');window.location='/staffhome/';</script>"
    return HttpResponse(msg)