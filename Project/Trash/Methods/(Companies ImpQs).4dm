//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_ImpQs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAct1)
	C_TEXT:C284($_t_oldMethodName; vSource)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_ImpQs")
//Companies_ImpQs
If (OK=1)
	//Gen_Confirm ("Do you want to allocate Analysis fields now or are they in"
	// the data?";"Now";"In Data")
	//  If (OK=1)
	//   DB_t_CurrentFormUsage:="Now"
	//   vStatus:=Gen Request("Status to Allocate:")
	//   If (OK=1)
	//     vType:=Gen Request("Business Type to Allocate:")
	//    If (OK=1)
	//      vSource:=Gen Request("Source to Allocate:")
	//     If (OK=1)
	//       vArea:=Gen Request("Area to Allocate:")
	//    If (OK=1)
	//     vSales:=Gen Request("Sales Person to Allocate:";◊User)
	//      If (OK=1)
	//
	//        SET CHANNEL(10;"")
	//     If (OK=1)
	//       CREATE EMPTY SET("CMaster")
	//       CREATE EMPTY SET("Master")
	//     End if
	//    End if
	//   End if
	//  End if
	//  End if
	// End if
	// Else
	//    vStatus:=""
	//   vType:=""
	//   vSource:=""
	//  vArea:=""
	// vSales:=""
	// DB_t_CurrentFormUsage:="In Data"
	If (Gen_Option)
		vSource:=Gen_Request("Other Source:")
	End if 
	If (OK=1)
		Gen_Confirm("Where any duplicates are found, do you want to"+" overwrite existing database data with that from the"+" import file, or to leave the records untouched?"; "Overwrite"; "Untouched")
		vAct1:=OK
		OK:=1
		vSource:=""
		SET CHANNEL:C77(10; "")
		If (OK=1)
			CREATE EMPTY SET:C140([COMPANIES:2]; "CMaster")
			CREATE EMPTY SET:C140([COMPANIES:2]; "Master")
			CREATE EMPTY SET:C140([CONTACTS:1]; "OMaster")
			CREATE EMPTY SET:C140([CONTACTS:1]; "Extra2")
		End if 
	End if 
End if 
//End if
ERR_MethodTrackerReturn("Companies_ImpQs"; $_t_oldMethodName)