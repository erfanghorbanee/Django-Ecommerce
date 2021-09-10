from django.contrib import admin
from .models import Order, OrderProduct

admin.site.register(OrderProduct)
admin.site.register(Order)


