class AddFive {
    static [int] AddFiveToObject([int] $int) {
        return (AddFiveToInt -Int $int)
    }
    static [string] AddFiveToObject([string] $string) {
        return (AddFiveToString -String $string)
    }
}