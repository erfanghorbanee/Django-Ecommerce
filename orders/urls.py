from django.urls import path
from .views import basket_view

urlpatterns = [
    path('basket/', basket_view, name='basket'),

]