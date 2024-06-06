CREATE DATABASE IF NOT EXISTS f1_entrega_final;
use f1_entrega_final;

-- Creación de la tabla Circuitos
CREATE TABLE Circuitos (
    circuitId INT PRIMARY KEY,
    circuitRef VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    country VARCHAR(255),
    lat DECIMAL(10, 8),
    lng DECIMAL(11, 8),
    alt INT,
    url VARCHAR(255)
);

-- Creación de la tabla Constructores
CREATE TABLE Constructores (
    constructorId INT PRIMARY KEY,
    constructorRef VARCHAR(255),
    name VARCHAR(255),
    nationality VARCHAR(255),
    url VARCHAR(255)
);

-- Tabla de Pilotos
CREATE TABLE IF NOT EXISTS Pilotos (
    driverId INT PRIMARY KEY,
    driverRef VARCHAR(255),
    number INT,
    code VARCHAR(10),
    forename VARCHAR(255),
    surname VARCHAR(255),
    dob DATE,
    nationality VARCHAR(255),
    url VARCHAR(255)
);

-- Tabla de Carreras
CREATE TABLE IF NOT EXISTS Carreras (
    raceId INT PRIMARY KEY,
    year INT,
    round INT,
    circuitId INT,
    name VARCHAR(255),
    date DATE,
    time TIME,
    url VARCHAR(255),
    FOREIGN KEY (circuitId) REFERENCES Circuitos(circuitId)
);


-- Creación de la tabla Status primero
CREATE TABLE IF NOT EXISTS Status (
    statusId INT PRIMARY KEY,
    status VARCHAR(255)
);


-- Tabla de Resultados
CREATE TABLE IF NOT EXISTS Resultados (
    resultId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    numberR INT,
    grid INT,
    position INT,
    positionText VARCHAR(255),
    positionOrder INT,
    points FLOAT,
    laps INT,
    timeR VARCHAR(255),
    milliseconds INT,
    fastestLap INT,
    rank1 INT,
    fastestLapTime VARCHAR(255),
    fastestLapSpeed VARCHAR(255),
    statusId INT,
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (driverId) REFERENCES Pilotos(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructores(constructorId),
    FOREIGN KEY (statusId) REFERENCES Status(statusId)
);

-- Tabla de Tiempos de Vuelta (Lap Times)
CREATE TABLE IF NOT EXISTS LapTimes (
    raceId INT,
    driverId INT,
    lap INT,
    position INT,
    time VARCHAR(255),
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, lap),
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (driverId) REFERENCES Pilotos(driverId)
);


-- Tabla de Paradas en Boxes (Pit Stops)
CREATE TABLE IF NOT EXISTS PitStops (
    raceId INT,
    driverId INT,
    stop INT,
    lap INT,
    time VARCHAR(255),
    duration VARCHAR(255),
    milliseconds INT,
    PRIMARY KEY (raceId, driverId, stop),
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (driverId) REFERENCES Pilotos(driverId)
);


-- Tabla de Sesiones de Clasificación (Qualifying)
CREATE TABLE IF NOT EXISTS Qualifying (
    qualifyId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    position INT,
    q1 VARCHAR(255),
    q2 VARCHAR(255),
    q3 VARCHAR(255),
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (driverId) REFERENCES Pilotos(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructores(constructorId)
);

-- Tabla de Resultados de Sprint (Sprint Results)
CREATE TABLE IF NOT EXISTS SprintResults (
    resultId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    grid INT,
    position INT,
    positionText VARCHAR(255),
    positionOrder INT,
    points FLOAT,
    laps INT,
    time VARCHAR(255),
    milliseconds INT,
    fastestLap INT,
    fastestLapTime VARCHAR(255),
    statusId INT,
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (driverId) REFERENCES Pilotos(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructores(constructorId)
);

-- Creación de la tabla DriverStandings (Clasificaciones de Pilotos)
CREATE TABLE IF NOT EXISTS DriverStandings (
    driverStandingsId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT,
    driverId INT,
    points FLOAT,
    position INT,
    positionText VARCHAR(255),
    wins INT,
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (driverId) REFERENCES Pilotos(driverId)
);

-- Creación de la tabla ConstructorResults (Resultados de Constructores)
CREATE TABLE IF NOT EXISTS ConstructorResults (
    constructorResultsId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT,
    constructorId INT,
    points FLOAT,
    status VARCHAR(255),
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (constructorId) REFERENCES Constructores(constructorId)
);

-- Creación de la tabla ConstructorStandings (Clasificaciones de Constructores)
CREATE TABLE IF NOT EXISTS ConstructorStandings (
    constructorStandingsId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT,
    constructorId INT,
    points FLOAT,
    position INT,
    positionText VARCHAR(255),
    wins INT,
    FOREIGN KEY (raceId) REFERENCES Carreras(raceId),
    FOREIGN KEY (constructorId) REFERENCES Constructores(constructorId)
);
