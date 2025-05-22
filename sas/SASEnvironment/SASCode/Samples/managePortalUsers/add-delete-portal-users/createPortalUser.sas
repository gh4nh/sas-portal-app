/*
 *  This program must be run as an admin user who has permissions
 *  to create user portal content areas, ie. Permission Trees, and
 *  can see those that exist.
 */

%inc "&sasDir./request_setup.sas";

/*  Set the user you want to create */

%if (%symexist(portalUser)=0) %then %do;
    %let portalUser=Group 4 User 1;
    %end;

%createPortalUser(name=%bquote(&portalUser.),rc=createPortalUserRC);

%put createPortalUserRC=&createPortalUserRC.;



