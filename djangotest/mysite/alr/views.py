from django.shortcuts import render
from rest_framework.views import APIView  
from alr.models import LicenseTags
from django.http import JsonResponse  

class HomeView(APIView):  

 def get(self, request, format=None):
    accmember = LicenseTags.objects.get(user='bnc')
    return JsonResponse({"message":accmember.tag})  
    
#from django.http import HttpResponse
# Create your views here.
#def index(request):
# Render the HTML template index.html with the data in the context variable
#    return render(request, 'index.html', context=context)
#    return HttpResponse("This is the index my page.")
