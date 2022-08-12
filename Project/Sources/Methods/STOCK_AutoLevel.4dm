//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_AutoLevel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $_bo_SaveRecord; Stock_bo_SkipCheck; Stock_bo_StockUpdated)
	C_LONGINT:C283($_l_RecordNumber; $_l_UpdateLevelsProcess; $2)
	C_REAL:C285(Stock_r_AllocCost; Stock_r_AllocLevel; Stock_r_FreeCost; Stock_r_FreeLevel)
	C_TEXT:C284($_t_AnalysisCode; $_t_Construct; $_t_Construct2; $_t_CurrencyCode; $_t_layerCode; $_t_Location; $_t_oldMethodName; $_t_ProductCode; $_t_StockType; $1; $3)
	C_TEXT:C284($4; $5; $6; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_AutoLevel")
//this method will be called from the trigger of a STOCK LEVEL record
//when loading the record it is directly called
If (True:C214)
	//when calling direct passed the -value of this
	$_t_CurrencyCode:=" "*(6-Length:C16($3))+$3
	$_t_layerCode:=" "*(6-Length:C16($4))+$4
	$_t_StockType:=" "*(6-Length:C16($5))+$5
	$_t_AnalysisCode:=" "*(6-Length:C16($6))+$6
	$_t_Construct:=$_t_CurrencyCode+$_t_layerCode+$_t_StockType+$_t_AnalysisCode
	If (Count parameters:C259>=7)
		$_t_Location:=" "*(6-Length:C16($7))+$7
		$_t_Construct:=$_t_Construct+$_t_Location
	End if 
	If ($2>0)
		
		If (Count parameters:C259>=7)
			//this is from a CURRENT STOCK record
			//all we want to do is recall this a  process
			//on the server to tell the stock level to check itsel
			If (Application type:C494=4D Remote mode:K5:5)
				$_l_UpdateLevelsProcess:=Execute on server:C373("Stock_AutoLevel"; DB_ProcessMemoryinit(1); "Update Stock levels"; $1; -$2; $3; $4; $5; $6; $7)
				
			Else 
				$_l_UpdateLevelsProcess:=New process:C317("Stock_AutoLevel"; DB_ProcessMemoryinit(1); "Update Stock levels"; $1; -$2; $3; $4; $5; $6; $7)
				
			End if 
		Else 
			//this is from a Stock level record so update the stock level
			//but as we are saving the record we will recall this in a process to update
			If (Application type:C494=4D Remote mode:K5:5)
				$_l_UpdateLevelsProcess:=Execute on server:C373("Stock_AutoLevel"; DB_ProcessMemoryinit(1); "Update Stock levels"; $1; -$2; $3; $4; $5; $6)
				
			Else 
				$_l_UpdateLevelsProcess:=New process:C317("Stock_AutoLevel"; DB_ProcessMemoryinit(1); "Update Stock levels"; $1; -$2; $3; $4; $5; $6)
				
			End if 
		End if 
		
	Else 
		//negative value means loading and update now
		If (Count parameters:C259>=7)
			DelayTicks(3*60)
			//we are loading a current stock record
			//i dont think we want to be doing anything
			//this should not be called from a [current stock] record
			//rather when this is called as part of a process
			$_l_RecordNumber:=Record number:C243([STOCK_LEVELS:58])
			$_t_Construct2:=$_t_CurrencyCode+$_t_layerCode+$_t_StockType+$_t_AnalysisCode
			$_t_ProductCode:=$1
			While (Semaphore:C143("StockLevel"+$_t_ProductCode))  //Prevent any other process from creating the same stock level
				DelayTicks(2)
			End while 
			READ WRITE:C146([STOCK_LEVELS:58])
			Stock_bo_SkipCheck:=True:C214  // dont redo the check
			
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11=$1+$_t_Construct2)
			$_bo_OK:=False:C215
			Repeat 
				If (Check_Locked(->[STOCK_LEVELS:58]; 0))
					Stock_r_FreeLevel:=0
					Stock_r_AllocLevel:=0
					Stock_r_FreeCost:=0
					Stock_r_AllocCost:=0
					Stock_bo_StockUpdated:=False:C215
					$_l_UpdateLevelsProcess:=New process:C317("STOCK_FindCurrent"; DB_ProcessMemoryinit(1); "Find Current Stock"; Current process:C322; ($1+$_t_Construct2))
					DelayTicks(2)
					Repeat 
						DelayTicks(2)
					Until (Stock_bo_StockUpdated=True:C214)
					//because we are here this is the current record so no need to change records
					[STOCK_LEVELS:58]Free_Level:3:=Stock_r_FreeLevel
					[STOCK_LEVELS:58]Allocated_Level:4:=Stock_r_AllocLevel
					[STOCK_LEVELS:58]Free_Cost:5:=Stock_r_FreeCost
					[STOCK_LEVELS:58]Allocated_Cost:6:=Stock_r_AllocCost
					If ([CURRENT_STOCK:62]X_ID:13=0)
						[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
					End if 
					Stock_bo_SkipCheck:=True:C214  // dont redo the check
					DB_SaveRecord(->[STOCK_LEVELS:58])
					AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
					//Need to find the related [Stock level] record to the [current stock] record
					$_bo_OK:=True:C214
				Else 
					DelayTicks(3)
				End if 
				
			Until ($_bo_OK)
			CLEAR SEMAPHORE:C144("StockLevel"+$_t_ProductCode)
		Else 
			$_bo_SaveRecord:=False:C215
			If ([STOCK_LEVELS:58]X_ID:10#Abs:C99($2))
				//called in a process
				DelayTicks(10*60)
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=Abs:C99($2))
				$_bo_OK:=False:C215
				
				Repeat 
					If (Check_Locked(->[STOCK_LEVELS:58]; 0))
						$_bo_OK:=True:C214
					Else 
						DelayTicks(3*60)
					End if 
				Until ($_bo_OK)
				$_bo_SaveRecord:=True:C214
			End if 
			
			Stock_r_FreeLevel:=0
			Stock_r_AllocLevel:=0
			Stock_r_FreeCost:=0
			Stock_r_AllocCost:=0
			Stock_bo_StockUpdated:=False:C215
			$_l_UpdateLevelsProcess:=New process:C317("STOCK_FindCurrent"; DB_ProcessMemoryinit(1); "Find Current Stock"; Current process:C322; ($1+$_t_Construct))
			DelayTicks(2)
			Repeat 
				DelayTicks(2)
			Until (Stock_bo_StockUpdated=True:C214)
			//because we are here this is the current record so no need to change records
			[STOCK_LEVELS:58]Free_Level:3:=Stock_r_FreeLevel
			[STOCK_LEVELS:58]Allocated_Level:4:=Stock_r_AllocLevel
			[STOCK_LEVELS:58]Free_Cost:5:=Stock_r_FreeCost
			[STOCK_LEVELS:58]Allocated_Cost:6:=Stock_r_AllocCost
			If ($_bo_SaveRecord)
				Stock_bo_SkipCheck:=True:C214  // dont redo the check
				DB_SaveRecord(->[STOCK_LEVELS:58])
				AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
			End if 
			
			
			
			
			
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("STOCK_AutoLevel"; $_t_oldMethodName)