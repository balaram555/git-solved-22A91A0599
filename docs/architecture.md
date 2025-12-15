# System Architecture

## Overview
DevOps Simulator follows a microservices-based architecture designed for high availability, scalability, and real-world DevOps practices.  
The system supports both **production** and **development** environments with clear separation of concerns.

---

## Production Architecture

### 1. Application Server
- **Technology**: Node.js + Express
- **Port**: 8080
- **Scaling**: Horizontal auto-scaling enabled

### 2. Database Layer
- **Database**: PostgreSQL 14
- **Configuration**: Master–slave replication
- **Backup**: Daily automated backups

### 3. Monitoring System
- **Tool**: Prometheus + Grafana
- **Metrics**: CPU, Memory, Disk, Network
- **Alerts**: Email notifications for critical issues

### Deployment Strategy
- **Method**: Rolling updates
- **Zero-downtime**: Yes
- **Rollback**: Automated on failure

### Security
- SSL/TLS encryption
- Encrypted database connections
- Regular security audits

---

## Development Architecture

> ⚠️ This section describes the **development environment** and includes experimental and debugging features.

### 1. Application Server
- **Technology**: Node.js + Express (with hot reload)
- **Port**: 3000
- **Debugging**: Chrome DevTools on port 9229
- **Scaling**: Single instance (manual)

### 2. Database Layer
- **Database**: PostgreSQL 14 (local instance)
- **Configuration**: Single instance (no replication)
- **Backup**: Manual backups
- **Seeding**: Auto-seed test data on startup

### 3. Monitoring System
- **Tool**: Console logging + optional Prometheus
- **Metrics**: CPU, Memory, Disk, Network, Build time
- **Alerts**: Console warnings only
- **Dashboard**: In-development web dashboard

### 4. Container Orchestration (Development)
- **Tool**: Docker Compose
- **Services**: Application, Database, Redis
- **Volume Mounts**: Source code for hot reload

### 5. Authentication System (Beta)
- **Method**: OAuth2 + JWT
- **Providers**: Google, GitHub (testing only)
- **Sessions**: Redis-based session storage

### Development Workflow
1. Make code changes
2. Auto-reload triggers rebuild
3. Run unit tests
4. Monitor console logs
5. Commit changes

### Development Security Notes
- SSL/TLS disabled (local only)
- Plain-text credentials (development only)
- CORS enabled for all origins
- Debug endpoints exposed

---

## Experimental Features
⚠️ **The following features are experimental and not enabled in production**:
- Multi-cloud deployment
- AI-powered log analysis
- Automatic rollback on anomaly detection
