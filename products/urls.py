from django.urls import path
from .views import home_view, products_view


urlpatterns = [
    path('', home_view, name='home'),
    path('products/', products_view, name='products'),
]