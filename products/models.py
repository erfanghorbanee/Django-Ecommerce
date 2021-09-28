from django.db import models
from django.shortcuts import reverse
from django.core.validators import MaxValueValidator, MinValueValidator


class Category(models.Model):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'Categories'


class ProductImage(models.Model):
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to="static/img/products_image", blank=False, null=False)

    def __str__(self):
        return self.name


class Product(models.Model):
    title = models.CharField(max_length=200, blank=False, null=False)
    price = models.PositiveIntegerField(blank=False, null=False)
    description = models.TextField(max_length=5000, blank=False, null=False)
    seller = models.CharField(max_length=200, default="بازار", blank=False, null=False)
    rate = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(5), MinValueValidator(0)])
    count = models.PositiveIntegerField(blank=True, null=True)
    image = models.ManyToManyField(ProductImage)

    UNAVAILABLE = False
    AVAILABLE = True
    status_type = (
        (UNAVAILABLE, "unavailable"),
        (AVAILABLE, "available")
    )
    status = models.BooleanField(default=True, choices=status_type, blank=False, null=False)

    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', blank=False, null=False)

    def __str__(self):
        return self.title
