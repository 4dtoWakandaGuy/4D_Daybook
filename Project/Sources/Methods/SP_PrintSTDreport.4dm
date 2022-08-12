//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_PrintSTDreport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	C_LONGINT:C283($_l_Index; $1; $2; $3)
	C_REAL:C285(SD_R_SubTotal; SD_R_SubTotal2; SP_R_GrandTotal; SP_R_GrandTotal2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_PrintSTDreport")
If (Count parameters:C259>=1)
	Case of 
		: ($1=2)
			//standard listing
			//A4 landscape
			//first-are we looking at a person or a group of people
			If ($2>0)
				//a person
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$2)
				Print form:C5([SALES_PROJECTION:113]; "SP_STDREPORT_HEADER")
				CREATE SET:C116([SALES_PROJECTION:113]; "Current Selection")
				For ($_l_Index; 1; Records in selection:C76([SALES_PROJECTION:113]))
					Print form:C5([SALES_PROJECTION:113]; "SP_STDREPORT_BODY1")
					NEXT RECORD:C51([SALES_PROJECTION:113])
				End for 
				Print form:C5([SALES_PROJECTION:113]; "SP_STDReport_Footer1")
				PAGE BREAK:C6
				
				
			Else 
				If ($3>0)
					QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=$3)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=[PERSONNEL_GROUPS:92]Group_Code:1)
					SP_R_GrandTotal:=0
					SP_R_GrandTotal2:=0
					SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS)
					For ($_l_Index; 1; Size of array:C274($_al_PersonIDS))
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_al_PersonIDS{$_l_Index})
						Print form:C5([SALES_PROJECTION:113]; "SP_STDREPORT_HEADER")
						CREATE SET:C116([SALES_PROJECTION:113]; "Current Selection")
						FIRST RECORD:C50([SALES_PROJECTION:113])
						For ($_l_Index; 1; Records in selection:C76([SALES_PROJECTION:113]))
							If ($_al_PersonIDS{$_l_Index}=[SALES_PROJECTION:113]PersonnelOwnerID:4)
								Print form:C5([SALES_PROJECTION:113]; "SP_STDREPORT_BODY1")
								SP_R_GrandTotal:=SP_R_GrandTotal+SD_R_SubTotal
								SP_R_GrandTotal2:=SP_R_GrandTotal2+SD_R_SubTotal2
								
							End if 
							NEXT RECORD:C51([SALES_PROJECTION:113])
						End for 
						Print form:C5([SALES_PROJECTION:113]; "SP_STDReport_Footer1")
					End for 
					Print form:C5([SALES_PROJECTION:113]; "SP_STDReport_Footer1")
					PAGE BREAK:C6
					
				End if 
			End if 
		: ($1=3)
			//print listing to disk
			
	End case 
	
End if 
ERR_MethodTrackerReturn("SP_PrintSTDreport"; $_t_oldMethodName)
