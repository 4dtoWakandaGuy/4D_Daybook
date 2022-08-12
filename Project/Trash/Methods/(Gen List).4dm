//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_CurrentOutputFormName; $_t_OldMethodName; $1; $2; $3; $6; $7; $8; $9; DB_t_CurrentFormUsage; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("Gen List")
$_t_CurrentOutputFormName:=WIN_t_CurrentOutputform

// this is not called at all now-NG Nov 2010

Start_Process
If (Execute_File($2))  //NG modified June 2004
	READ ONLY:C145($4->)
	While ($5->=1)
		IDLE:C311  // 03/04/03 pb
		Execute_Sel($6)
		If ($5->=1)
			If (Records in selection:C76($4->)>0)
				CREATE SET:C116($4->; $3)
				vNo:=Records in selection:C76($4->)
				DB_t_CurrentFormUsage:="Print"
				WIN_t_CurrentOutputform:=$8  //NG added this May 2004
				Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
				FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252($4))
				
				WIn_SetFormSize(1; $4; WIN_t_CurrentOutputform)
				DISPLAY SELECTION:C59($4->; *)  //NG may 2004 added $4 to this line
				If (OK=1)
					FORM SET OUTPUT:C54($4->; $8)  //NG may 2004 added $4 to this line
					DB_t_CurrentFormUsage:=$9
					PRINT SELECTION:C60($4->)  //NG may 2004 added $4 to this line
				End if 
				Close_ProWin
				$5->:=0
			Else 
				Gen_None($7; $5)
			End if 
		End if 
	End while 
	DB_t_CurrentFormUsage:=""
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputFormName
ERR_MethodTrackerReturn("Gen List"; $_t_OldMethodName)