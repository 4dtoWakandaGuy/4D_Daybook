//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor Read Only
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 07:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor Read Only")
//Minor Read Only
READ ONLY:C145([AREAS:3])
READ ONLY:C145([STATUS:4])
READ ONLY:C145([TYPES:5])
READ ONLY:C145([SOURCES:6])
READ ONLY:C145([PERSONNEL:11])
READ ONLY:C145([PRODUCT_BRANDS:8])
READ ONLY:C145([PRODUCT_GROUPS:10])
READ ONLY:C145([ACTIONS:13])
READ ONLY:C145([RESULTS:14])
READ ONLY:C145([CONTRACT_TYPES:19])
READ ONLY:C145([PROBLEMS:22])
READ ONLY:C145([SOLUTIONS:23])
READ ONLY:C145([ACCOUNTS:32])
READ ONLY:C145([PERIODS:33])
READ ONLY:C145([TAX_CODES:35])
READ ONLY:C145([ANALYSES:36])
ERR_MethodTrackerReturn("Minor Read Only"; $_t_oldMethodName)