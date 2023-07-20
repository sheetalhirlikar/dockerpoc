from django.urls import path, include
from .views import HomeView
urlpatterns = [
    #path('', alr.views.index, name='index'),
    path('', HomeView.as_view(), name='home')
]

