List<Map<String, dynamic>> salesData = [
  {
    'year': 2020,
    'soldA': 16.0,
    'soldB': 8.0,
  },
  {
    'year': 2021,
    'soldA': 24.0,
    'soldB': 12.0,
  },
  {
    'year': 2022,
    'soldA': 15.0,
    'soldB': 7.5,
  },
  {
    'year': 2023,
    'soldA': 18.0,
    'soldB': 9.0,
  },
  {
    'year': 2024,
    'soldA': 12.0,
    'soldB': 6.0,
  },
];
List<Map<String, dynamic>> precipForecast = [
  {
    'day': 'SAT',
    'ecmwf': 10.0,
    'nbm': 14.0,
    'wpc': 11.0,
    'gfs': 8.0,
  },
  {
    'day': 'SUN',
    'ecmwf': 3.0,
    'nbm': 2.0,
    'wpc': 1.0,
    'gfs': 3.0,
  },
  {
    'day': 'MON',
    'ecmwf': 15.0,
    'nbm': 17.0,
    'wpc': 22.0,
    'gfs': 11.5,
  },
  {
    'day': 'TUE',
    'ecmwf': 16.0,
    'nbm': 18.0,
    'wpc': 12.0,
    'gfs': 19.0,
  },
  {
    'day': 'WED',
    'ecmwf': 8.0,
    'nbm': 4.0,
    'wpc': 7.0,
    'gfs': 6.0,
  },
  {
    'day': 'THU',
    'ecmwf': 9.0,
    'nbm': 10.0,
    'wpc': 9.0,
    'gfs': 11.0,
  },
  {
    'day': 'FRI',
    'ecmwf': 2.0,
    'nbm': 0.0,
    'wpc': 1.0,
    'gfs': 3.0,
  },
];
List<Map<String, dynamic>> humidityDewData = [
  {
    'day': 'SAT',
    'humidity': 37.0,
    'dewpoint': 19.0,
    'precip': 8.0,
    'windDirection': 10.0,
  },
  {
    'day': 'SUN',
    'humidity': 65.0,
    'dewpoint': 48.0,
    'precip': 12.5,
    'windDirection': -35.5,
  },
  {
    'day': 'MON',
    'humidity': 69.0,
    'dewpoint': 48.0,
    'precip': 13.0,
    'windDirection': -20.0,
  },
  {
    'day': 'TUE',
    'humidity': 49.0,
    'dewpoint': 69.0,
    'precip': 20.0,
    'windDirection': 20.0,
  },
  {
    'day': 'WED',
    'humidity': 51.0,
    'dewpoint': 80.0,
    'precip': 9.0,
    'windDirection': 50.0,
  },
  {
    'day': 'THU',
    'humidity': 70.0,
    'dewpoint': 49.0,
    'precip': 2.0,
    'windDirection': 20.0,
  },
  {
    'day': 'FRI',
    'humidity': 60.0,
    'dewpoint': 41.0,
    'precip': 7.0,
    'windDirection': -37.0,
  },
];

List<Map<String, dynamic>> hourlyWeatherInfo = [
  {'hour': '10 AM', 'precip': 2.0, 'wind': 12.0, 'windDirection': 12.0},
  {'hour': '11 AM', 'precip': 3.0, 'wind': 14.0, 'windDirection': -12.0},
  {'hour': '12 PM', 'precip': 4.0, 'wind': 16.0, 'windDirection': -22.0},
  {'hour': '01 PM', 'precip': 3.0, 'wind': 11.0, 'windDirection': 30.0},
  {'hour': '02 PM', 'precip': 0.0, 'wind': 15.0, 'windDirection': 15.0},
  {'hour': '03 PM', 'precip': 2.0, 'wind': 12.0, 'windDirection': -20.0},
  {'hour': '04 PM', 'precip': 8.0, 'wind': 17.0, 'windDirection': -30.0},
  {'hour': '05 PM', 'precip': 12.0, 'wind': 20.0, 'windDirection': 12.0},
  {'hour': '06 PM', 'precip': 7.0, 'wind': 23.0, 'windDirection': 22.0},
  {'hour': '07 PM', 'precip': 6.0, 'wind': 17.0, 'windDirection': 30.0},
  {'hour': '08 PM', 'precip': 2.0, 'wind': 12.0, 'windDirection': 12.0},
  {'hour': '09 PM', 'precip': 1.0, 'wind': 13.0, 'windDirection': -10.0},
  {'hour': '10 PM', 'precip': 0.8, 'wind': 12.0, 'windDirection': 0.0},
  {'hour': '11 PM', 'precip': 3.0, 'wind': 8.0, 'windDirection': 5.0},
  {'hour': '12 AM', 'precip': 4.0, 'wind': 12.0, 'windDirection': 15.0},
  {'hour': '01 AM', 'precip': 4.0, 'wind': 16.0, 'windDirection': 12.0},
  {'hour': '02 AM', 'precip': 5.0, 'wind': 18.0, 'windDirection': 32.0},
  {'hour': '03 AM', 'precip': 2.0, 'wind': 22.0, 'windDirection': -10.0},
  {'hour': '04 AM', 'precip': 6.0, 'wind': 20.0, 'windDirection': -16.0},
  {'hour': '05 AM', 'precip': 4.0, 'wind': 23.0, 'windDirection': 30.0},
  {'hour': '06 AM', 'precip': 2.0, 'wind': 18.0, 'windDirection': 45.0},
  {'hour': '07 AM', 'precip': 10.0, 'wind': 14.0, 'windDirection': -20.0},
  {'hour': '08 AM', 'precip': 12.0, 'wind': 12.0, 'windDirection': -18.0},
  {'hour': '09 AM', 'precip': 11.0, 'wind': 10.0, 'windDirection': 45.0},
];

List<Map<String, dynamic>> areaChartData = [
  {
    'day': 1,
    'temp': {
      '2020': 40,
      '2021': 35,
    }
  },
  {
    'day': 2,
    'temp': {
      '2020': 41,
      '2021': 38,
    }
  },
  {
    'day': 3,
    'temp': {
      '2020': 42,
      '2021': 36,
    }
  },
  {
    'day': 4,
    'temp': {
      '2020': 38,
      '2021': 39,
    }
  },
  {
    'day': 5,
    'temp': {
      '2020': 38,
      '2021': 41,
    }
  },
  {
    'day': 6,
    'temp': {
      '2020': 36,
      '2021': 43,
    }
  },
  {
    'day': 7,
    'temp': {
      '2020': 37,
      '2021': 44,
    }
  },
  {
    'day': 8,
    'temp': {
      '2020': 38,
      '2021': 42,
    }
  },
  {
    'day': 9,
    'temp': {
      '2020': 39,
      '2021': 40,
    }
  },
  {
    'day': 10,
    'temp': {
      '2020': 40,
      '2021': 40,
    }
  },
  {
    'day': 11,
    'temp': {
      '2020': 42,
      '2021': 37,
    }
  },
  {
    'day': 12,
    'temp': {
      '2020': 44,
      '2021': 36,
    }
  },
  {
    'day': 13,
    'temp': {
      '2020': 43,
      '2021': 34,
    }
  },
  {
    'day': 14,
    'temp': {
      '2020': 46,
      '2021': 32,
    }
  },
  {
    'day': 15,
    'temp': {
      '2020': 45,
      '2021': 30,
    }
  },
];
