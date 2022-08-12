//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetSource
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
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

$_t_oldMethodName:=ERR_MethodTracker("SD_SetSource")
If ([DIARY:12]Data_Source_Table:49>0)  //this field contains the source table
	Case of 
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[CONTACTS:1]))
			SDiary_MenV(4)
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[COMPANIES:2]))
			SDiary_MenV(3)
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[PRODUCTS:9]))
			SDiary_MenV(5)
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[ORDERS:24]))
			SDiary_MenV(7)
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOBS:26]))
			SDiary_MenV(9)
			
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[SERVICE_CALLS:20]))
			SDiary_MenV(8)
		: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOB_STAGES:47]))
			SDiary_MenV(13)
	End case 
End if 
ERR_MethodTrackerReturn("SD_SetSource"; $_t_oldMethodName)