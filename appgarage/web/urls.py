from django.urls import path

from .views import *

urlpatterns = [
    path('', image_upload, name='upload'),
]