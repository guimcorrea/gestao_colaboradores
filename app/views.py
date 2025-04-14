from django.shortcuts import render, redirect
from .models import Colaborador
from .forms import ColaboradorForm

def lista_colaboradores(request):
    colaboradores = Colaborador.objects.all()
    return render(request, 'colaboradores/lista.html', {'colaboradores': colaboradores})

def novo_colaborador(request):
    if request.method == 'POST':
        form = ColaboradorForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('lista_colaboradores')
    else:
        form = ColaboradorForm()
    return render(request, 'colaboradores/novo.html', {'form': form})

