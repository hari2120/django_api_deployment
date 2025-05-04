import os
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
def env_test(request):
    env_value = os.getenv('MY_TEST_ENV', 'Default Value')  # Get the env variable or default
    return JsonResponse({'env_value': env_value})
