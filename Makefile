# Определение переменных
PYTHON = python
PIP = pip
VENV = venv
TESTS_DIR = tests

# Цели
.PHONY: install test clean format

# Установка зависимостей
install:
	@echo "Создаю виртуальное окружение..."
	$(PYTHON) -m venv $(VENV)
	@echo "Устанавливаю зависимости..."
	$(VENV)/bin/pip install -r requirements.txt || $(VENV)/Scripts/pip install -r requirements.txt

# Очистка проекта
clean:
	@echo "Удаляю виртуальное окружение и кэш..."
	rm -rf $(VENV)
	rm -rf __pycache__

# Автоформатирование с помощью black
format:
	@echo "Автоформатирую код с помощью black..."
	$(VENV)/bin/black . || $(VENV)/Scripts/black .