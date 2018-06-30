function GetControlByName{
    param([string]$name)
    if(Get-Member -InputObject $this -Name Children){
        foreach($item in $this.Children){
            if($item.Name -eq $name){
                return $item
            } else {
                if(Get-Member -InputObject $item -Name GetControlByName){
                    $foundItem=$item.GetControlByName($name)
                    if($foundItem){
                        return $foundItem
                    }
                }
            }
        }
    }
}