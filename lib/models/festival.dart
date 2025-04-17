enum Festival {
  tejeon,
  gilum;

  String get name {
    switch (this) {
      case Festival.tejeon:
        return '태전동 ESG 신비한 페스티벌';
      case Festival.gilum:
        return '길음동 ESG 신비한 페스티벌';
    }
  }

  String get id {
    switch (this) {
      case Festival.tejeon:
        return '67f8ce198193f9d83b7e1435';
      case Festival.gilum:
        return '67f8b4c98193f9d83b7e1430';
    }
  }

  String get raffleId {
    switch (this) {
      case Festival.tejeon:
        return '20250415-1646';
      case Festival.gilum:
        return '20250415-1646';
    }
  }
}