Feature: DMSING Test Automation

  Scenario: Verify the brain component is up and running
    Given a connection to the Unix server is established
    And the path "/home/kiranmote" is navigated
    When the script "job_status_example.sh" is executed
    Then all main and child job statuses should be "Success"

  Scenario: Verify the data in AAS0 table
    Given the AAS0 table exists in the database
    When the data in the AAS0 table is checked
    Then the date of all records should be "08-08-2025"

  Scenario: Verify the data in AAS1 table
    Given the AAS1 table exists in the database
    When the data in the AAS1 table is checked
    Then the date of all records should be "08-08-2025"

  Scenario: Verify the data in AAS2 table
    Given the AAS2 table exists in the database
    When the data in the AAS2 table is checked
    Then the date of all records should be "08-08-2025"

  Scenario: Verify the status_flag in AA_DMSI_FEED_DETAILS table
    Given the AA_DMSI_FEED_DETAILS table exists in the database
    When the status_flag in the s2 table for processed records is verified
    Then for all stages (feed_to_s0, s0_to_s1, s1_to_s2), the status_flag should be "Y"
