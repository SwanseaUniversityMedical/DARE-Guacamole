from setuptools import setup, find_packages

with open('requirements.txt') as fp:
    requirements = fp.readlines()

setup(
    version='1.0.0',
    name='connection-controller',
    description='A k8s contoller to syncronize cluster resources with the Guacamole REST API.',
    url='https://github.com/SwanseaUniversityMedical/DARE-Guacamole',
    author='Joss Whittle',
    author_email='joss@chi.swan.ac.uk',
    packages=find_packages('src'),
    package_dir={'': 'src'},
    test_suite='tests',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'License :: OSI Approved :: MIT License',
        'Natural Language :: English',
        'Programming Language :: Python :: 3.11',
        'Operating System :: POSIX :: Linux',
    ],
    license='Apache License, Version 2.0',
    zip_safe=False,
    install_requires=requirements
)