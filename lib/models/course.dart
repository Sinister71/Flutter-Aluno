class Course {
  final String name;
  final String description;
  final List<String> subjects;
  final int duration; // em semestres

  Course({
    required this.name,
    required this.description,
    required this.subjects,
    required this.duration,
  });

  static List<Course> getAvailableCourses() {
    return [
      Course(
        name: 'Ciência da Computação',
        description: 'Curso focado em programação, algoritmos e desenvolvimento de software.',
        duration: 8,
        subjects: [
          'Programação I',
          'Programação II',
          'Estruturas de Dados',
          'Algoritmos',
          'Banco de Dados',
          'Engenharia de Software',
          'Redes de Computadores',
          'Inteligência Artificial',
          'Sistemas Operacionais',
          'Matemática Discreta',
        ],
      ),
      Course(
        name: 'Administração',
        description: 'Curso voltado para gestão empresarial e administração de negócios.',
        duration: 8,
        subjects: [
          'Fundamentos da Administração',
          'Contabilidade Geral',
          'Marketing',
          'Recursos Humanos',
          'Finanças Corporativas',
          'Gestão de Projetos',
          'Empreendedorismo',
          'Economia',
          'Direito Empresarial',
          'Estatística Aplicada',
        ],
      ),
      Course(
        name: 'Design Gráfico',
        description: 'Curso criativo focado em design visual e comunicação.',
        duration: 6,
        subjects: [
          'Fundamentos do Design',
          'Tipografia',
          'Teoria das Cores',
          'Adobe Photoshop',
          'Adobe Illustrator',
          'Adobe InDesign',
          'Design Digital',
          'Branding',
          'Design Editorial',
          'Portfolio Criativo',
        ],
      ),
    ];
  }
}
