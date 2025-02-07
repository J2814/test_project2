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
	# Установка зависимостей для Windows и Linux
	@if [ -f "$(VENV)/Scripts/activate" ]; then \
		$(VENV)/Scripts/activate && pip install -r requirements.txt; \
	elif [ -f "$(VENV)/bin/activate" ]; then \
		. $(VENV)/bin/activate && pip install -r requirements.txt; \
	fi

# Запуск тестов
test:
	@echo "Запускаю тесты..."
	# Находим правильный путь для активации окружения и запускаем тесты
	@if [ -f "$(VENV)/Scripts/activate" ]; then \
		$(VENV)/Scripts/activate && pytest $(TESTS_DIR); \
	elif [ -f "$(VENV)/bin/activate" ]; then \
		. $(VENV)/bin/activate && pytest $(TESTS_DIR); \
	fi

# Очистка проекта
clean:
	@echo "Удаляю виртуальное окружение и кэш..."
	@if exist $(VENV) rmdir /s /q $(VENV)
	@if exist __pycache__ rmdir /s /q __pycache__

# Автоформатирование с помощью black
format:
	@echo "Автоформатирую код с помощью black..."
	# Активируем и форматируем код
	@if [ -f "$(VENV)/Scripts/activate" ]; then \
		$(VENV)/Scripts/activate && black .; \
	elif [ -f "$(VENV)/bin/activate" ]; then \
		. $(VENV)/bin/activate && black .; \
	fi
