# UFC Fight Analytics & Machine Learning Project

## Overview

As a long-time UFC fan, I wanted to explore whether historical fighter statistics and fight data could be used to predict how a fight ends.

This project is an end-to-end UFC data pipeline that:

- Collects UFC data through web scraping
- Stores and organizes the data in a SQL Server database
- Cleans and transforms the raw data into machine learning-ready datasets
- Engineers fighter comparison features
- Trains machine learning models to analyze fight outcomes

The primary machine learning objective explored in this project was predicting the method of victory:

- Submission
- KO/TKO
- Decision
- Other

---

# Project Structure

## AUTOSCRAPERS

Contains automation notebooks used to update the database when new UFC events become available.

### Files

#### total_auto_scraper.ipynb

Main automated pipeline.

Responsibilities:

- Check for newly completed UFC events
- Scrape new events
- Scrape new fights
- Scrape fight details
- Update existing fighter statistics
- Identify and insert new fighters
- Prepare data for database insertion

#### stoped_working_via_requests.ipynb

Legacy implementation used before UFCStats introduced stricter scraping protections.

Kept for documentation and reference purposes.

---

## DATA

General-purpose folder for exported datasets and intermediate files.

---

## DATA_CLEANING-PREPROCCECING

Contains notebooks responsible for transforming raw scraped data into structured datasets.

### events.ipynb

Processes event-level information:

- Event date
- Event location
- Event type
- Country
- Region
- City
- Main card indicator

### fights.ipynb

Processes fight-level information:

- Fighter names
- Fight result
- Weight classes
- Fight methods
- Round information
- Fight duration

### fight_details.ipynb

Processes detailed striking statistics:

- Significant strikes
- Head strikes
- Body strikes
- Leg strikes
- Distance strikes
- Clinch strikes
- Ground strikes

### fighters.ipynb

Processes fighter profile information:

- Record
- Height
- Reach
- Weight
- Stance
- Age
- Striking statistics
- Grappling statistics

---

## MAPPINGS

Contains categorical encoding mappings used throughout preprocessing and model training.

### Available mappings

- city_mapping.json
- country_mapping.json
- region_mapping.json
- month_mapping.json
- stance_mapping.json
- weight_class_mapping.json
- method_basic.json
- method_detailed.json

These mappings ensure consistent encoding between training and future predictions.

---

## QUERIES

Contains SQL scripts used to create database tables.

### Files

#### create_and_insert_events.sql

Creates and populates the Events table.

#### create_table_fights.sql

Creates the Fights table.

#### create_table_fight_details.sql

Creates the FightDetails table.

#### create_table_fighters.sql

Creates the Fighters table.

---

## SCRAPERS

Contains the individual scraping modules used to collect UFC data.

### just_events_scraper.ipynb

Scrapes UFC events.

### fight_per_event.ipynb

Collects all fights associated with a specific event.

### fight_details.ipynb

Collects detailed fight statistics.

### fighter_links.ipynb

Extracts fighter profile URLs.

### fighter_stats.ipynb

Collects fighter statistics and profile information.

### connecting_keys.ipynb

Creates relationships between fighters, fights, events, and fight details.

---

## TRAINING_DATA

Contains processed datasets used during model development.

### events_training.csv

Event-level features.

### fights_training.csv

Fight-level features.

### fighters_training.csv

Fighter-level features.

### fight_details_training.csv

Detailed striking statistics.

---

## TRAINING

Contains machine learning experiments and training datasets.

### all_joined.csv

Fully joined dataset used for modeling.

Includes:

- Event information
- Fight information
- Fighter statistics
- Encoded categorical features

### method.ipynb

Main machine learning notebook.

Includes:

- Feature engineering
- Feature selection
- Model training
- Evaluation
- Confusion matrix analysis
- Classification reports

### failed.ipynb

Experiments and approaches that did not improve performance but were kept for documentation and future reference.

---

# Database Design

The project stores data in SQL Server using four primary entities:

## Events

Stores event-level information.

Examples:

- UFC 300
- UFC Fight Night
- UFC 317

---

## Fights

Stores fight-level information.

Examples:

- Winner
- Weight class
- Method
- Fight duration

---

## Fight Details

Stores detailed strike distribution and performance statistics.

Examples:

- Head strikes
- Body strikes
- Ground strikes
- Significant strike percentages

---

## Fighters

Stores fighter profile and career statistics.

Examples:

- Wins
- Losses
- Reach
- Height
- Striking metrics
- Grappling metrics

---

# Machine Learning Goal

The main machine learning task explored in this project is:

## Multi-Class Classification

Predicting how a UFC fight ends.

Target classes:

| Class | Description |
|---------|------------|
| 0 | Submission |
| 1 | KO/TKO |
| 2 | Other |
| 3 | Decision |

Several feature engineering approaches were tested, including:

- Fighter vs Fighter statistical differences
- Physical attribute comparisons
- Experience-based metrics
- Striking efficiency comparisons
- Grappling efficiency comparisons

---

# Key Findings

The experiments suggest that:

- Fight outcomes contain predictive signal
- Decision outcomes are easier to identify than finishes
- KO/TKO and Submission outcomes have significant overlap when only pre-fight statistics are available
- Aggregated fighter statistics alone have limitations when attempting to model real fight dynamics

---

# Technologies Used

- Python
- Pandas
- NumPy
- Requests
- BeautifulSoup
- SQL Server
- PyODBC
- Scikit-Learn
- XGBoost
- Jupyter Notebook

---

# Future Improvements

Potential future improvements include:

- Round-by-round feature generation
- Temporal fighter performance tracking
- Elo-style fighter ratings
- Probability-based prediction outputs
- Automated retraining pipeline
- Alternative machine learning architectures

---

# Disclaimer

This project was created for educational, analytical, and machine learning experimentation purposes.

The goal was to explore the complete lifecycle of a real-world data project, from data collection and storage to feature engineering and predictive modeling.
