# Daily Bible Study - OBS Automation Tools

This project contains a set of scripts to automate the setup of daily scripture scenes in OBS for a Bible study broadcast. It uses `dbs-initiator` to plan the passages and `obs-scene-transporter` to create the corresponding scenes in OBS from a template.

## Prerequisites

Before you begin, ensure you have the following installed and available in your system's `PATH`:

- **Bash**: For running the main script.
- **Python 3.x**: For the virtual environment and dependencies.
- **dbs-initiator**: The Go-based tool for planning passages. (Replace with the actual link to your repo).
- **GitHub CLI**: `gh` (optional, for repository creation).

## Setup

1. **Clone the repository:**

    ```bash
    git clone <repository-url>
    cd obs-tools
    ```

2. **Create and activate a Python virtual environment:**

    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. **Install the required Python packages:**

    ```bash
    pip install -r requirements.txt
    ```

4. **Prepare OBS Template:**
    Ensure you have an OBS scene collection exported as `Daily-Template.zip` in the project root. This will be used as the template for new scenes.

## Usage

The workflow is designed to be run on a weekly basis to prepare for the upcoming sessions.

1. **Create a Weekly Plan:**
    Copy the template to create a plan file for the week. It's helpful to name it based on the date range.

    ```bash
    cp templatePlan.sh weekly-plan-example.sh
    ```

2. **Edit the Plan:**
    Open `weekly-plan-example.sh` and update the `scripture` array with the six scripture passages for the week.

3. **Run the Automation Script:**
    Execute `prepDaily.sh` and pass your new plan file as an argument.

    ```bash
    ./prepDaily.sh weekly-plan-example.sh
    ```

The script will then iterate through each passage, adding it to `dbs-initiator` and creating a new scene in OBS named after the scripture reference.
