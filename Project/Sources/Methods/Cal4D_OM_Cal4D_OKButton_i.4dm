//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_Cal4D_OKButton_i
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 12:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(Cal4D_d_EventEndDate; Cal4D_d_EventStartDate)
	C_LONGINT:C283(<>Cal_rb1; <>Cal_rb3)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; Cal4D_t_EventTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_Cal4D_OKButton_i")


Case of 
	: ((Cal4D_t_EventTitle="") & (<>Cal_rb1#1))  //"All-Day"
		Cal4D_Alert("TitleRequired")
		HIGHLIGHT TEXT:C210(Cal4D_t_EventTitle; 1; 100)
		
	: (Cal4D_d_EventEndDate<Cal4D_d_EventStartDate)
		Cal4D_Alert("InvalidEndDate")
		
	Else 
		If (<>Cal_rb3=3)  // "Banner"
			//◊Cal4D_EventPictureFld_ptr->:=◊Cal4D_EventPictureFld_ptr->*0  `   ... that won't be used.
		End if 
		
		ACCEPT:C269
End case 
ERR_MethodTrackerReturn("Cal4D_OM_Cal4D_OKButton_i"; $_t_oldMethodName)