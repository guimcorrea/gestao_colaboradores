from django.urls import path
from . import views

urlpatterns = [
    path('', views.lista_colaboradores, name='lista_colaboradores'),
    path('novo/', views.novo_colaborador, name='novo_colaborador'),
]

