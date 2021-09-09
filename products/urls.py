from django.urls import path, include
from .views import categories_view


urlpatterns = [
    path('', categories_view, name='categories'),
]