PYTHON = python
PIP = pip
VENV = venv
TESTS_DIR = tests


.PHONY: install test clean format


install:
	@echo "Создаю виртуальное окружение..."
	$(PYTHON) -m venv $(VENV)
	@echo "Устанавливаю зависимости..."
	# Установка зависимостей для Windows и Linux
	@if [ -f "$(VENV)/Scripts/activate" ]; then \
		$(VENV)/Scripts/activate && pip install -r requirements.txt; \
	elif [ -f "$(VENV)/bin/activate" ]; then \
		. $(VENV)/bin/activate && pip install -r requirements.txt; \
	fi


test:
	@echo "Запускаю тесты..."
	$(VENV)/Scripts/activate && pytest $(TESTS_DIR)


clean:
	@echo "Удаляю виртуальное окружение и кэш..."
	@if exist $(VENV) rmdir /s /q $(VENV)
	@if exist __pycache__ rmdir /s /q __pycache__


format:
	@echo "Автоформатирую код с помощью black..."
	$(VENV)/Scripts/activate && black .
