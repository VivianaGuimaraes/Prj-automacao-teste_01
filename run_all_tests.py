# ESTE SCRIPT EM PYTHON EXECUTA TODOS OS ARQUIVOS DE SUITES DE TESTES (.ROBOT) INDIVIDUALMENTE, 
# E SALVA OS RESULTADOS DE CADA UM ARQUIVO DE SUITES DE TESTES EM SEU PRÓPRIO DIRETÓRIO COM TIMESTAMP (DIA E HORA DA EXECUÇÃO).
# CAMINHO PARA EXECUTAR: C:\BP-WEB>python run_all_tests.py

import os
import glob
import datetime
import subprocess

# Caminhos principais
tests_dir = "tests"
reports_base = "reults_tests"

# Garante que a pasta de relatórios existe
os.makedirs(reports_base, exist_ok=True)

# Percorre todos os arquivos .robot na pasta tests/
robot_files = glob.glob(os.path.join(tests_dir, "*.robot"))

# Executa cada teste individualmente
for robot_file in robot_files:
    test_name = os.path.splitext(os.path.basename(robot_file))[0]
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    output_dir = os.path.join(reports_base, f"{test_name}_{timestamp}")
    os.makedirs(output_dir, exist_ok=True)

    print(f"Executando: {test_name} → Resultados em: {output_dir}")

    # Comando Robot Framework
    subprocess.run([
        "robot",
        f"--outputdir={output_dir}",
        robot_file
    ])
