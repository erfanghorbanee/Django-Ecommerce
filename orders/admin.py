from django.contrib import admin
from .models import Order, OrderHistory

admin.site.register(OrderHistory)
admin.site.register(Order)


