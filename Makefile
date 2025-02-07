
PYTHON = python
PIP = pip
VENV = venv
TESTS_DIR = tests


.PHONY: install test clean format


install:
	@echo "Создаю виртуальное окружение..."
	$(PYTHON) -m venv $(VENV)
	@echo "Активирую виртуальное окружение..."
	$(VENV)/Scripts/activate
	@echo "Устанавливаю зависимости..."
	$(PIP) install -r requirements.txt


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
