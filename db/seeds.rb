# frozen_string_literal: true

# People
justin = Person.find_or_create_by(
  name: 'Justin',
  surname: 'Timberlake',
  document: '79877842068',
  birthdate: '02/12/2005'.to_date,
  email: 'justin@email.com'
)
angelina = Person.find_or_create_by(
  name: 'Angelina',
  surname: 'Jolie',
  document: '17568397009',
  birthdate: '31/05/1977'.to_date,
  email: 'angelina@email.com'
)
beyonce = Person.find_or_create_by(
  name: 'Beyoncé',
  document: '25408438082',
  birthdate: '07/08/1986'.to_date,
  email: 'beyoncé@email.com'
)
brad = Person.find_or_create_by(
  name: 'Brad',
  surname: 'Pitt',
  document: '87839967027',
  birthdate: '16/05/1971'.to_date,
  email: 'brad@email.com'
)
tom = Person.find_or_create_by(
  name: 'Tom',
  surname: 'Cruise',
  document: '36031680033',
  birthdate: '07/02/1948'.to_date,
  email: 'tom@email.com'
)
gisele = Person.find_or_create_by(
  name: 'Gisele',
  surname: 'Bündchen',
  document: '33888115043',
  birthdate: '26/02/1962'.to_date,
  email: 'gisele@email.com'
)
will = Person.find_or_create_by(
  name: 'Will',
  surname: 'Smith',
  document: '80050339079',
  birthdate: '12/01/1987'.to_date,
  email: 'will@email.com'
)

# Phones
Phone.find_or_create_by(
  person: justin,
  code: '011',
  number: '7987-7842',
  phone_type: 'comercial',
  preferential: true
)
Phone.find_or_create_by(
  person: angelina,
  code: '021',
  number: '1756-8397',
  phone_type: 'particular',
  preferential: true
)
Phone.find_or_create_by(
  person: beyonce,
  code: '045',
  number: '2540-8438',
  phone_type: 'trabalho',
  preferential: true
)
Phone.find_or_create_by(
  person: brad,
  code: '036',
  number: '98783-9967',
  phone_type: 'particular',
  preferential: true
)
Phone.find_or_create_by(
  person: tom,
  code: '022',
  number: '3603-1680',
  phone_type: 'comercial',
  preferential: true
)
Phone.find_or_create_by(
  person: gisele,
  code: '032',
  number: '3388-8115',
  phone_type: 'particular',
  preferential: true
)
Phone.find_or_create_by(
  person: will,
  code: '011',
  number: '98005-0339',
  phone_type: 'trabalho',
  preferential: true
)

# Licenses
License.find_or_create_by(
  person: justin,
  number: '7195601426',
  modalities: 'A,B',
  expiration_date: '02/12/2023'.to_date
)
License.find_or_create_by(
  person: angelina,
  number: '6943716123',
  modalities: 'A,C',
  expiration_date: '31/05/2022'.to_date
)
License.find_or_create_by(
  person: beyonce,
  number: '1180791711',
  modalities: 'B',
  expiration_date: '07/08/2024'.to_date
)
License.find_or_create_by(
  person: brad,
  number: '4022223573',
  modalities: 'E',
  expiration_date: '16/05/2023'.to_date
)
License.find_or_create_by(
  person: tom,
  number: '4792176902',
  modalities: 'D',
  expiration_date: '07/02/2023'.to_date
)
License.find_or_create_by(
  person: gisele,
  number: '1910131222',
  modalities: 'A,B',
  expiration_date: '26/02/2023'.to_date
)
License.find_or_create_by(
  person: will,
  number: '6892136432',
  modalities: 'A',
  expiration_date: '12/10/2019'.to_date
)

# Vehicles
Vehicle.find_or_create_by(
  model: 'CB 300',
  color: 'vermelho',
  vehicle_type: 'moto',
  license_plate: 'AHD-5454',
  daily_rate: 99.99
)
hb20 = Vehicle.find_or_create_by(
  model: 'HB 20',
  color: 'preto',
  vehicle_type: 'carro',
  license_plate: 'FMR-6345',
  daily_rate: 139.99
)
agrale = Vehicle.find_or_create_by(
  model: 'Agrale 6500',
  color: 'prata',
  vehicle_type: 'VUC',
  license_plate: 'RGH-4245',
  daily_rate: 199.99
)
Vehicle.find_or_create_by(
  model: 'Millennium III',
  color: 'azul',
  vehicle_type: 'onibus',
  license_plate: 'BTF-5278',
  daily_rate: 279.99
)
Vehicle.find_or_create_by(
  model: 'Atego 2425',
  color: 'branco',
  vehicle_type: 'caminhão',
  license_plate: 'BYT-2354',
  daily_rate: 409.99
)

# Rentals
Rental.find_or_create_by(
  person: angelina,
  vehicle: hb20,
  value: 199.98,
  start_date: '07/11/2019 10:30',
  end_date: '09/11/2019 10:20',
  withdrawal_date: '07/11/2019 10:40',
  return_date: '09/11/2019 09:20'
)
Rental.find_or_create_by(
  person: brad,
  vehicle: agrale,
  value: 399.98,
  start_date: '07/11/2019 08:10',
  end_date: '09/11/2019 10:20',
  withdrawal_date: '07/11/2019 08:00',
  return_date: '09/11/2019 10:20'
)
