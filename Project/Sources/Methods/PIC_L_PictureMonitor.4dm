//%attributes = {}
If (False:C215)
	//Project Method Name:      PIC_l_PictureMonitor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/04/2010 21:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_ProductGraphicLoaded)
	C_LONGINT:C283($_l_Index; $_l_RecordsInSelection; $_l_Time)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PIC_l_PictureMonitor")
//ok so if we are going to make products as having no graphic. we have to monitor the records to see if the graphic exists
Repeat 
	READ ONLY:C145([PRODUCTS:9])
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Picture_Exists:53<0)
	If (Records in selection:C76([PRODUCTS:9])>0)
		CREATE SET:C116([PRODUCTS:9]; "$Tocheck")
		$_l_RecordsInSelection:=Records in selection:C76([PRODUCTS:9])
		
		For ($_l_Index; 1; $_l_RecordsInSelection)
			
			USE SET:C118("$Tocheck")
			GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_Index)
			$_bo_ProductGraphicLoaded:=Prod_LoadGraphic([PRODUCTS:9]X_ID:43; 0)
			If ($_bo_ProductGraphicLoaded)
				READ WRITE:C146([PRODUCTS:9])
				LOAD RECORD:C52([PRODUCTS:9])
				[PRODUCTS:9]x_Picture_Exists:53:=1
				DB_SaveRecord(->[PRODUCTS:9])
				UNLOAD RECORD:C212([PRODUCTS:9])
				READ ONLY:C145([PRODUCTS:9])
			End if 
			
			
			If (Not:C34(<>SYS_bo_QuitCalled))
				DELAY PROCESS:C323(Current process:C322; 60*10)  //every 10 seconds check
			End if 
			If (<>SYS_bo_QuitCalled)
				$_l_Index:=$_l_RecordsInSelection
			End if 
		End for 
	End if 
	$_l_Time:=Current time:C178(*)*1+(60*60)
	Repeat   //delay for an hour
		DELAY PROCESS:C323(Current process:C322; 60*10)  //every 10 seconds check
	Until ((Current time:C178*1)>$_l_Time) | (<>SYS_bo_QuitCalled)
	
	
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("PIC_l_PictureMonitor"; $_t_oldMethodName)
