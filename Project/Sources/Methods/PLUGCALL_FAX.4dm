//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_FAX
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
	C_LONGINT:C283($2; FAX_Return)
	C_POINTER:C301($4; $5; $6)
	C_TEXT:C284($_t_oldMethodName; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_FAX")
FAX_Return:=-99999
Case of 
	: ($1="SetDriver")
		Case of 
			: ($2=1)
				If (Count parameters:C259>=3)
					//SetChooser($3)
				Else 
					//SetChooser("")
				End if 
			: ($2=2)
				
				If (Count parameters:C259>=4)
					//$4->:=SPSwitchPrinter(1)
				Else 
					
				End if 
		End case 
	: ($1="SwitchPrinter")
		Case of 
			: ($2=1)
				If (Count parameters:C259>=3)
					//SetChooser($3)
				Else 
					//SetChooser("")
				End if 
			: ($2=2)
				
				If (Count parameters:C259>=4)
					//$4->:=SPSwitchPrinter(2)
				Else 
					
				End if 
		End case 
	: ($1="EndMessage")
		Case of 
			: ($2=1)
			: ($2=2)
				//$6»:=SPEndMessage ($3»;$4»;$5»)
		End case 
	: ($1="PickServer")
		Case of 
			: ($2=1)
			: ($2=2)
				//$8->:=SPPickServer($4->;$5->;$6->;$7->)
		End case 
		
	: ($1="SetServer")
		Case of 
			: ($2=1)
			: ($2=2)
				//$8->:=SPSetServer($4->;$5->;$6->;$7->;True)
				
		End case 
	: ($1="StartMessage")
		Case of 
			: ($2=1)
			: ($2=2)
				//$6»:=SPStartMessage($3»;$4»;$5»;False)
		End case 
	: ($1="AddAddress")
		Case of 
			: ($2=1)
			: ($2=2)
				//$8->:=SPAddAddress($3;$4->;$5->;$6->;$7->;Current date;Current time)
				
		End case 
	: ($1="PickEnclosure")
		Case of 
			: ($2=1)
			: ($2=2)
				//$4»:=SPPickEnclosure ($3)
		End case 
	: ($1="PreparePrint")
		//$8»:=SPPreparePrint (◊FaxResol)
	: ($1="AddComment")
		//$4->:=SPAddComment($3;◊FaxResol)
	: ($1="SetDetails")
		Case of 
			: ($2=1)
				//$6->:=SetFaxDetails($3;$4->;$5->;◊FaxResol;1)
				
		End case 
	: ($1="SetTime")
		Case of 
			: ($2=1)
				//$6»:=SetFaxTime($3»;$4»)
		End case 
	: ($1="SetCover")
		Case of 
			: ($2=1)
				//$7->:=FaxCover($3->;$4->;$5->;$6->)
		End case 
End case 
ERR_MethodTrackerReturn("PLUGCALL_FAX"; $_t_oldMethodName)
