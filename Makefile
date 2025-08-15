NAME			= inception
COMPOSE_FILE	= ./srcs/docker-compose.yml
DATA_PATH		= /Users/b/Desktop/incep/data
MARIADB_DATA	= $(DATA_PATH)/mariadb
WORDPRESS_DATA	= $(DATA_PATH)/wordpress
REDIS_DATA		= $(DATA_PATH)/redis
	
RED		= \033[0;31m
GREEN	= \033[0;32m
YELLOW	= \033[0;33m
BLUE	= \033[0;34m
PURPLE	= \033[0;35m
CYAN	= \033[0;36m
WHITE	= \033[0;37m
RESET	= \033[0m
	
	# ================================== RULES ================================== #
	
all: build up 
	@echo "$(GREEN)✅ $(NAME) is up and running!$(RESET)"

build:
	@echo "$(YELLOW)🔨 Creating data directories...$(RESET)"
	@sudo mkdir -p $(MARIADB_DATA) || true
	@sudo mkdir -p $(WORDPRESS_DATA) || true
	@sudo mkdir -p $(REDIS_DATA) || true
	@echo "$(BLUE)🐳 Building Docker containers...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) build --no-cache
	
up:
	@echo "$(CYAN)🚀 Starting services...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d
	@echo "$(GREEN)✅ All services are running!$(RESET)"
	@echo "$(CYAN)🌐 Access your services:$(RESET)"
	@echo "$(GREEN)  • WordPress: https://amel-has.42.fr$(RESET)"
	@echo "$(GREEN)  • Adminer: http://localhost:8080$(RESET)"
	@echo "$(GREEN)  • Portainer: http://localhost:9000$(RESET)"
	@echo "$(GREEN)  • Website: http://localhost:8000$(RESET)"
	@echo "$(GREEN)  • FTP: ftp://localhost:21 (user: amine)$(RESET)"
	
down:
	@echo "$(YELLOW)🛑 Stopping services...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) down
	
clean: down
	@echo "$(RED)🧹 Cleaning up containers and volumes...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) down -v
	
fclean: clean
	@echo "$(RED)💀 Performing deep cleanup...$(RESET)"
	@docker system prune -af --volumes
	@echo "$(RED)🗑️  Removing data directories...$(RESET)"
	@sudo rm -rf $(MARIADB_DATA)/* $(WORDPRESS_DATA)/* $(REDIS_DATA)/*
	@echo "$(GREEN)✅ Deep cleanup completed!$(RESET)"
	
re: fclean all
	@echo "$(PURPLE)🔄 Rebuild completed!$(RESET)"
	
status:
	@echo "$(CYAN)📊 Docker containers status:$(RESET)"
	@docker compose -f $(COMPOSE_FILE) ps
	
logs:
	@echo "$(CYAN)📜 Showing logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f
	
	logs-nginx:
	@echo "$(CYAN)📜 Showing nginx logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f nginx
	
logs-mariadb:
	@echo "$(CYAN)📜 Showing mariadb logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f mariadb
	
logs-wordpress:
	@echo "$(CYAN)📜 Showing wordpress logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f wordpress
	
logs-redis:
	@echo "$(CYAN)📜 Showing redis logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f redis
	
logs-adminer:
	@echo "$(CYAN)📜 Showing adminer logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f adminer
	
logs-portainer:
	@echo "$(CYAN)📜 Showing portainer logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f portainer
	
logs-ftp:
	@echo "$(CYAN)📜 Showing ftp logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f ftp
	
logs-website:
	@echo "$(CYAN)📜 Showing website logs...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) logs -f website
	
restart:
	@echo "$(YELLOW)🔄 Restarting all services...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart
	
restart-nginx:
	@echo "$(YELLOW)🔄 Restarting nginx...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart nginx
	
restart-mariadb:
	@echo "$(YELLOW)🔄 Restarting mariadb...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart mariadb
	
restart-wordpress:
	@echo "$(YELLOW)🔄 Restarting wordpress...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart wordpress
	
restart-redis:
	@echo "$(YELLOW)🔄 Restarting redis...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart redis
	
restart-adminer:
	@echo "$(YELLOW)🔄 Restarting adminer...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart adminer
	
restart-portainer:
	@echo "$(YELLOW)🔄 Restarting portainer...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart portainer
	
restart-ftp:
	@echo "$(YELLOW)🔄 Restarting ftp...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart ftp
	
restart-website:
	@echo "$(YELLOW)🔄 Restarting website...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) restart website
	
up-nginx:
	@echo "$(CYAN)🚀 Starting nginx...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d nginx
	
up-mariadb:
	@echo "$(CYAN)🚀 Starting mariadb...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d mariadb
	
up-wordpress:
	@echo "$(CYAN)🚀 Starting wordpress...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d wordpress
	
up-redis:
	@echo "$(CYAN)🚀 Starting redis...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d redis
	
up-adminer:
	@echo "$(CYAN)🚀 Starting adminer...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d adminer
	
up-portainer:
	@echo "$(CYAN)🚀 Starting portainer...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d portainer
	
up-ftp:
	@echo "$(CYAN)🚀 Starting ftp...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d ftp
	
up-website:
	@echo "$(CYAN)🚀 Starting website...$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d website
	
help:
	@echo "$(BLUE)📖 Inception Project - Available Commands:$(RESET)"
	@echo ""
	@echo "$(PURPLE)🔧 Main Commands:$(RESET)"
	@echo "$(GREEN)  make all$(RESET)              - Build and start all services"
	@echo "$(GREEN)  make build$(RESET)            - Build Docker containers"
	@echo "$(GREEN)  make up$(RESET)               - Start all services"
	@echo "$(GREEN)  make down$(RESET)             - Stop all services"
	@echo "$(GREEN)  make clean$(RESET)            - Stop services and remove volumes"
	@echo "$(GREEN)  make fclean$(RESET)           - Deep cleanup (remove everything)"
	@echo "$(GREEN)  make re$(RESET)               - Rebuild everything from scratch"
	@echo "$(GREEN)  make status$(RESET)           - Show containers status"
	@echo ""
	@echo "$(CYAN)📜 Logs Commands:$(RESET)"
	@echo "$(GREEN)  make logs$(RESET)             - Show all logs (follow mode)"
	@echo "$(GREEN)  make logs-nginx$(RESET)       - Show nginx logs"
	@echo "$(GREEN)  make logs-mariadb$(RESET)     - Show mariadb logs"
	@echo "$(GREEN)  make logs-wordpress$(RESET)   - Show wordpress logs"
	@echo "$(GREEN)  make logs-redis$(RESET)       - Show redis logs"
	@echo "$(GREEN)  make logs-adminer$(RESET)     - Show adminer logs"
	@echo "$(GREEN)  make logs-portainer$(RESET)   - Show portainer logs"
	@echo "$(GREEN)  make logs-ftp$(RESET)         - Show ftp logs"
	@echo "$(GREEN)  make logs-website$(RESET)     - Show website logs"
	@echo ""
	@echo "$(YELLOW)🔄 Restart Commands:$(RESET)"
	@echo "$(GREEN)  make restart$(RESET)          - Restart all services"
	@echo "$(GREEN)  make restart-nginx$(RESET)    - Restart nginx service"
	@echo "$(GREEN)  make restart-mariadb$(RESET)  - Restart mariadb service"
	@echo "$(GREEN)  make restart-wordpress$(RESET) - Restart wordpress service"
	@echo "$(GREEN)  make restart-redis$(RESET)    - Restart redis service"
	@echo "$(GREEN)  make restart-adminer$(RESET)  - Restart adminer service"
	@echo "$(GREEN)  make restart-portainer$(RESET) - Restart portainer service"
	@echo "$(GREEN)  make restart-ftp$(RESET)      - Restart ftp service"
	@echo "$(GREEN)  make restart-website$(RESET)  - Restart website service"
	@echo ""
	@echo "$(BLUE)🚀 Individual Start Commands:$(RESET)"
	@echo "$(GREEN)  make up-nginx$(RESET)         - Start only nginx"
	@echo "$(GREEN)  make up-mariadb$(RESET)       - Start only mariadb"
	@echo "$(GREEN)  make up-wordpress$(RESET)     - Start only wordpress"
	@echo "$(GREEN)  make up-redis$(RESET)         - Start only redis"
	@echo "$(GREEN)  make up-adminer$(RESET)       - Start only adminer"
	@echo "$(GREEN)  make up-portainer$(RESET)     - Start only portainer"
	@echo "$(GREEN)  make up-ftp$(RESET)           - Start only ftp"
	@echo "$(GREEN)  make up-website$(RESET)       - Start only website"
	@echo ""
	@echo "$(WHITE)💡 Quick Access URLs:$(RESET)"
	@echo "$(CYAN)  • WordPress: https://amel-has.42.fr$(RESET)"
	@echo "$(CYAN)  • Adminer: http://localhost:8080$(RESET)"
	@echo "$(CYAN)  • Portainer: http://localhost:9000$(RESET)"
	@echo "$(CYAN)  • Website: http://localhost:8000$(RESET)"
	@echo "$(CYAN)  • FTP: ftp://localhost:21 (user: amine)$(RESET)"