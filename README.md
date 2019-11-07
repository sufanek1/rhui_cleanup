# rhui_cleanup
This is rhui cleanup script.
It is supposed to delete rpms in /var/lib/rhui/remote_share
which will can remain even after orphan cleanup, and are as well not listed as orphans.
https://access.redhat.com/documentation/en-us/red_hat_update_infrastructure/3.0/html/system_administrators_guide/manage_content#orphaned_content_units
