//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessServices_CreateFromtrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/06/2010 09:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(PS_bl_Blob)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $7; $_bo_Boolean1; SV_bo_Boolean1; SVS_bo_Boolean1)
	C_LONGINT:C283(<>DB_l_ProcessServerCreator; $1; $2; $4; $5; $6; SVS_l_Long1; SVS_l_Long2; SVS_l_Long3; SVS_l_RecordID; SVS_l_TableNumber)
	C_POINTER:C301(SVS_P_TablePtr)
	C_TEXT:C284($_t_oldMethodName; $3; $8; SVS_t_BlobasText; SVS_t_ServiceName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessServices_CreateFromtrans")
If (Count parameters:C259>=8)
	
	
	SET BLOB SIZE:C606(PS_bl_Blob; 0)
	SVS_l_TableNumber:=0
	SVS_P_TablePtr:=Table:C252($1)
	SVS_l_RecordID:=$2
	SVS_t_ServiceName:=$3
	SVS_l_Long1:=$4
	SVS_l_Long2:=$5
	SVS_l_Long3:=$6
	SV_bo_Boolean1:=$7
	SVS_t_BlobasText:=$8
	
	
	
	
	
	
	
	
	
	
	Repeat 
		While (Semaphore:C143("PSBusy"))
			
			DelayTicks(60)
			
		End while 
		$_bo_Boolean1:=SV_bo_Boolean1
		
		If (SVS_t_BlobasText#"")
			TEXT TO BLOB:C554(SVS_t_BlobasText; PS_bl_Blob; Mac text without length:K22:10)
			ProcessServices_CreateRecord(SVS_P_TablePtr; ->SVS_l_RecordID; SVS_t_ServiceName; SVS_l_Long1; SVS_l_Long2; SVS_l_Long3; SV_bo_Boolean1; ->PS_bl_Blob)
			
			
			
			
			
			
			
			
		Else 
			If (SV_bo_Boolean1)
				ProcessServices_CreateRecord(SVS_P_TablePtr; ->SVS_l_RecordID; SVS_t_ServiceName; SVS_l_Long1; SVS_l_Long2; SVS_l_Long3; SV_bo_Boolean1)
				
				
				
				
			Else 
				If (SVS_l_Long3#0)
					ProcessServices_CreateRecord(SVS_P_TablePtr; ->SVS_l_RecordID; SVS_t_ServiceName; SVS_l_Long1; SVS_l_Long2; SVS_l_Long3)
					
					
				Else 
					If (SVS_l_Long2#0)
						ProcessServices_CreateRecord(SVS_P_TablePtr; ->SVS_l_RecordID; SVS_t_ServiceName; SVS_l_Long1; SVS_l_Long2)
						
						
					Else 
						If (SVS_l_Long1#0)
							ProcessServices_CreateRecord(SVS_P_TablePtr; ->SVS_l_RecordID; SVS_t_ServiceName; SVS_l_Long1)
							
							
						Else 
							
							ProcessServices_CreateRecord(SVS_P_TablePtr; ->SVS_l_RecordID; SVS_t_ServiceName)
							
							
						End if 
					End if 
				End if 
			End if 
		End if 
		SVS_l_TableNumber:=0
		SVS_l_RecordID:=0
		
		SVS_t_ServiceName:=""
		SVS_l_Long1:=0
		SVS_l_Long2:=0
		SVS_l_Long3:=0
		SVS_bo_Boolean1:=False:C215
		SVS_t_BlobasText:=""
		//SVS_l_RecordID:=0
		
		
		
		
		
		
		
		
		
		
		
		
		CLEAR SEMAPHORE:C144("PSBusy")
		Repeat 
			DelayTicks(60)
		Until (SVS_l_RecordID>0) | (<>SYS_bo_QuitCalled)
		
		
		If (SVS_l_TableNumber>0)
			
			
			SVS_P_TablePtr:=Table:C252(SVS_l_TableNumber)
		End if 
		SVS_l_RecordID:=SVS_l_RecordID
		
		
		
		
	Until (<>SYS_bo_QuitCalled)
End if 
<>DB_l_ProcessServerCreator:=0
ERR_MethodTrackerReturn("ProcessServices_CreateFromtrans"; $_t_oldMethodName)