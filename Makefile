#**************************************************************************************************
#
#   Makefile adaptado para el proyecto Pong usando raylib y archivos .cpp
#
#**************************************************************************************************

.PHONY: all clean

# Nombre del proyecto
PROJECT_NAME ?= pong

# Ruta al directorio de raylib, ajustar según la ubicación de raylib
RAYLIB_PATH ?= C:/Users/ciste/OneDrive/Escritorio/Code/Cpp/Libraries/raylib-5.0_win64_mingw-w64

# Compilador
CXX ?= g++

# Flags de compilación
CFLAGS = -w -I$(RAYLIB_PATH)/include -std=c++11

# Flags de enlazador
LDFLAGS = -L$(RAYLIB_PATH)/lib -lraylib -lopengl32 -lgdi32 -lwinmm

# Directorio de fuentes y objetos
SRC_DIR = src
OBJ_DIR = obj

# Fuentes y objetos
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Directorio de destino para el ejecutable
DESTDIR ?= .
RAYLIB_INSTALL_PATH ?= $(DESTDIR)/lib

# Regla por defecto
all: $(PROJECT_NAME)

# Construcción del proyecto
$(PROJECT_NAME): $(OBJS)
	@echo "Linking..."
	@$(CXX) $^ -o $(DESTDIR)/$@ $(LDFLAGS)

# Compilación de los objetos
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo "Compiling $<..."
	@mkdir -p $(OBJ_DIR)
	@$(CXX) -c $< -o $@ $(CFLAGS)

# Limpieza del proyecto
clean:
	@echo "Cleaning..."
	@rm -f $(OBJ_DIR)/*.o $(DESTDIR)/$(PROJECT_NAME)
	@echo "Clean completed."

