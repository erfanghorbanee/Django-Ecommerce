# Generated by Django 5.0.1 on 2024-01-31 14:04

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("products", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="product",
            name="slug",
            field=models.SlugField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name="product",
            name="seller",
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name="product",
            name="title",
            field=models.CharField(max_length=100, unique=True),
        ),
    ]