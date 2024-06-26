%macro genPSPortalPageParameters;

     %if (%symexist(NOOFCOLUMNS)) %then %do;
         put "<NumberOfColumns>&NOOFCOLUMNS.</NumberOfColumns>";

         put "<Columns>";

         %do i=1 %to &NOOFCOLUMNS.;

             put "<Column>";

             %if (%symexist(Column&i.Width)) %then %do;

                 put "<Width>&&Column&i.Width</Width>";
                 %end;

             put "<Portlets>";

             %if (%symexist(Column&i.Portlets_Count)) %then %do;
                 %do j=1 %to &&Column&i.Portlets_Count.;

                     put "<Portlet>&&&Column&i.Portlets&j..</Portlet>";
                     %end;

                 %end;
             %else %do;
                 %if (%symexist(Column&i.Portlets)) %then %do;
                     put "<Portlet>&&Column&i.Portlets.</Portlet>";
                     %end;

                 %end;

             put "</Portlets>";
             put "</Column>";

             %end;
         
         put "</Columns>";

         %end;
     %if (%symexist(LAYOUTTYPE)) %then %do;
         put "<LayoutType>&LAYOUTTYPE.</LayoutType>";
         %end;
     %if (%symexist(PageRank)) %then %do;
         put "<PageRank>&PageRank.</PageRank>";
         %end;

     %if (%symexist(scope)) %then %do;
         put "<Scope>&scope.</Scope>";
         %end;

     /*
      *  If the Scope value has changed, then should we also move the Portlets referenced on that page?
      */

     %if (%symexist(movePortletsOnPage)) %then %do;
         put "<MovePortletsOnPage>&movePortletsOnPage.</MovePortletsOnPage>";
         %end;
 
%mend;


%genPSPortalPageParameters;

