from django.urls import path
from . import views

urlpatterns = [
    path('env-test/', views.env_test, name='env_test'),
]
