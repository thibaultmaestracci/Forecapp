
# Forecapp - basic weather app

## A demo weather app ( using foreca api )

- MVVM + Cordinator architecture
- delegate pattern between View and ViewModel
- closure between Model/api and ViewModel
- Mock of the foreca client is used for basic Test

For now it display weather data for Montpellier, France
Feel free to improve and pull request

### Intallation
- Almofire :
pod 'Alamofire', '~> 5.4'

- Api Setup
create a dev account on foreca api website https://corporate.foreca.com/en/foreca-weather-api
log your credential in /Model/ForecaClientAccount

